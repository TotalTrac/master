SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceGetSequenceRange2_OLD]
	--@MailerID	int -- = 106596
	@MailingID	int
	, @Range	int
AS
BEGIN

SET NOCOUNT ON;

DECLARE @TotalSequences int = @Range;
DECLARE @ClientID int;
DECLARE @UserID int;

-- get our client ID and created by id
SELECT
	@ClientID = j.JOB_CLIENTID
	--, @UserID = s.MAILSEGMENT_CREATEDBYID
	, @UserID = m.JOB_CREATEDBYID
FROM
	--dbo.MailSegments AS s
	--INNER JOIN dbo.Jobs AS m
	--	ON s.MAILSEGMENT_JOBID = m.JOB_ID
	dbo.Jobs AS m		
	INNER JOIN job.Jobs AS j
		ON m.JOB_JOBID = j.JOB_ID
WHERE
	--s.MAILSEGMENT_ID = @MailingID;
	m.JOB_ID = @MailingID;

-- table to hold our return values
DECLARE @Sequences TABLE
(
	-- this will be our order by column
	-- will not be returned to the client
	ROW_ID			int
	-- columns to return to the client
	, FirstVal		sql_variant
	, LastVal		sql_variant
	, CycleCount	int
	, SeqIncrement	sql_variant
	, MailerID		int
	, MinSeq		sql_variant
	, MaxSeq		sql_variant
);

-- get our mailer ids
DECLARE mid_cursor SCROLL CURSOR 
FOR 
	SELECT [Id], [MailerId], [IsDefaultTrackingId] FROM usps.Mailers WHERE [ClientId] = @ClientID ORDER BY [Id];

-- current row of the MID cursor we are processing
-- we'll need this to figure out where to start
-- looping through the MID sequences (i.e. which
--	MID has isdefaulttracking = 1)
DECLARE @CurrentRow int = 0;	
-- what row of the MID sequence cursor to start processing with
DECLARE @StartRow int = 0;	
-- the total number of MIDs
--DECLARE @Count int = 0;
-- the id value of the current currsor row
DECLARE @ID int = 0;
-- the mid value of the current currsor row
DECLARE @MailerID int = 0;
-- the isdefaulttracking value of the current currsor row
DECLARE @IsDefault bit = 0;

BEGIN TRY
	BEGIN TRANSACTION
		OPEN mid_cursor

		FETCH FIRST FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
  
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			SET @CurrentRow = @CurrentRow + 1;
			
			DECLARE @SequenceName nvarchar(4000) = 'dbo.IMbSequence_' + CONVERT(varchar, @MailerID) + '';

			-- See if the sequence exists SO = Sequence Object
			IF NOT EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(@SequenceName) AND type = 'SO')
				BEGIN
					DECLARE @MinValue int;
					DECLARE @MaxValue int;

					IF LEN(CONVERT(varchar, @MailerID)) = 6
						BEGIN
							SET @MinValue = 000000000;
							SET @MaxValue = 999999999;
						END
					ELSE
						BEGIN
							SET @MinValue = 000000;
							SET @MaxValue = 999999;
						END

					DECLARE @CreateSequenceSql nvarchar(4000) = 
						'CREATE SEQUENCE ' + @SequenceName
							+ ' AS [int] '
							+ ' START WITH ' + CONVERT(varchar(9), @MinValue)
							+ ' INCREMENT BY 1 '
							+ ' MINVALUE ' + CONVERT(varchar(9), @MinValue)
							+ ' MAXVALUE ' + CONVERT(varchar(9), @MaxValue)
							+ ' CYCLE '
							+ ' NO CACHE;';

					EXEC sp_executesql @CreateSequenceSql;
				END

				-- if this is the default tracking MID we want to start
				-- processing with this MID when we start fetching again
				-- after this loop through
				IF @IsDefault = 1 
					BEGIN
						SET @StartRow = @CurrentRow;
					END

			FETCH NEXT FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
		END   

		SET @CurrentRow = 0;
		-- the current value of the first sequence we encounter
		-- we'll need this if we loop back to this sequence so
		-- that we can use values up to but not including this value
		DECLARE @StartMid int = NULL;
		DECLARE @StartSequence sql_variant = NULL;
		-- If we loop back and don't have enough sequences
		-- we need to force the cyclecount = 1
		DECLARE @ForceCycle bit = 0;

		-- start fethcing with the default ID
		FETCH ABSOLUTE @StartRow FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			
			SET @SequenceName = 'IMbSequence_' + CONVERT(varchar, @MailerID) + '';

			SET @CurrentRow = @CurrentRow + 1;

			-- If this is the first sequence, get it's current value
			-- we'll need this if we loop back to this sequence so
			-- that we can use values up to but not including this value
			IF (@CurrentRow = 1)
				BEGIN
					SET @StartMid = @MailerID;
					SELECT @StartSequence = current_value FROM sys.sequences WHERE [name] = @SequenceName;
				END
				
			-- see if we've looped back to where we started
			IF (@CurrentRow <> 1 AND  @MailerID = @StartMid)
				BEGIN
					-- we're back to the first mailer ID we've used. If its initial value
					-- was 0, just break out of the loop.  This means we may not have 
					--	satisfied the requested range of IMbs
					IF (@Range = 0 OR @StartSequence = 0)
						BREAK;

					-- we can only take up to but not including the starting sequence from
					-- this mailer id sequence.  By decrementing the @range variable, the
					-- cyclecount returned from the sequence will always come back as zero
					-- we'll need to force that to a 1 later on
					IF (@Range >= (CONVERT(int, @StartSequence) + 1))
						BEGIN
							IF (@Range > (CONVERT(int, @StartSequence) + 1))
								BEGIN
									SET @ForceCycle = 1;
								END

							SET @Range = CONVERT(int, @StartSequence);-- + 1;
						END
				END

			DECLARE  
				@FirstSeqNum sql_variant
				, @LastSeqNum sql_variant
				, @CycleCount int
				, @SeqIncr sql_variant
				, @SeqMinVal sql_variant
				, @SeqMaxVal sql_variant;

			EXEC sys.sp_sequence_get_range
				@sequence_name = @SequenceName
				, @range_size = @Range
				, @range_first_value = @FirstSeqNum OUTPUT 
				, @range_last_value = @LastSeqNum OUTPUT 
				, @range_cycle_count = @CycleCount OUTPUT
				, @sequence_increment = @SeqIncr OUTPUT
				, @sequence_min_value = @SeqMinVal OUTPUT
				, @sequence_max_value = @SeqMaxVal OUTPUT;

			-- if we've satisfied the range without 
			--	cycling just break of out the while
			IF @CycleCount = 0 AND @LastSeqNum <> @SeqMaxVal
				BEGIN
					-- we kept ourselves from cycling the sequence
					-- to prevent duplicate sequence values from
					-- being returned. Force @CycleCount to 1
					-- so that we return the current value to the client
					IF @ForceCycle = 1
						BEGIN
							SET @CycleCount = 1;
						END

					INSERT @Sequences
					(
						ROW_ID
						, FirstVal
						, LastVal
						, MailerID
						, CycleCount
						, SeqIncrement
						, MinSeq
						, MaxSeq
					)
					VALUES
					(
						@CurrentRow
						, @FirstSeqNum
						, @LastSeqNum
						, @ID
						, @CycleCount
						, @SeqIncr
						, @SeqMinVal
						, @SeqMaxVal
					);
					BREAK;
				END

			DECLARE @ResetSequenceSql nvarchar(MAX) = 'ALTER SEQUENCE ' + @SequenceName + ' RESTART WITH 0';

			-- if we've satisfied the range and we ended up
			-- exactly on the sequence's max value, we 
			-- need to reset the sequence and update the
			-- current mailer id to not be default and set
			-- the next one to be default
			IF @CycleCount = 0 AND @LastSeqNum = @SeqMaxVal
				BEGIN
					INSERT @Sequences
					(
						ROW_ID
						, FirstVal
						, LastVal
						, MailerID
						, CycleCount
						, SeqIncrement
						, MinSeq
						, MaxSeq
					)
					VALUES
					(
						@CurrentRow
						, @FirstSeqNum
						, @LastSeqNum
						, @ID
						, @CycleCount
						, @SeqIncr
						, @SeqMinVal
						, @SeqMaxVal
					);

					-- reset this sequence
					EXEC sp_executesql @ResetSequenceSql;
					-- update this mailer id
					UPDATE usps.Mailers SET [IsDefaultTrackingId] = 0 WHERE [MailerId] = @MailerID;
					-- set the next mailer id
					-- fetch the next mid from the cursor...
					FETCH NEXT FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
					-- ...see if we've passed the end and need to loop back
					IF @@FETCH_STATUS <> 0  
						BEGIN
							FETCH FIRST FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
						END
					UPDATE usps.Mailers SET [IsDefaultTrackingId] = 1 WHERE [MailerId] = @MailerID;
					BREAK;
				END

			-- we haven't satisfied the requested range,
			-- meaning we've cycled at leaqst once

			-- set the last value of the sequence to its maxval
			SET @LastSeqNum = @SeqMaxVal;

			INSERT @Sequences
			(
				ROW_ID
				, FirstVal
				, LastVal
				, MailerID
				, CycleCount
				, SeqIncrement
				, MinSeq
				, MaxSeq
			)
			VALUES
			(
				@CurrentRow
				, @FirstSeqNum
				, @LastSeqNum
				, @ID
				, @CycleCount
				, @SeqIncr
				, @SeqMinVal
				, @SeqMaxVal
			);

			--SET @TotalSequences = @TotalSequences + (@LastSeqNum - @FirstSeqNum + 1);
			SET @Range = @Range - (CONVERT(int, @LastSeqNum) - CONVERT(int, @FirstSeqNum) + 1);

			-- reset this sequence
			EXEC sp_executesql @ResetSequenceSql;
			-- update this mailer id
			UPDATE usps.Mailers SET [IsDefaultTrackingId] = 0 WHERE [MailerId] = @MailerID;
		
			-- fetch the next mid from the cursor...
			FETCH NEXT FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
			-- ...see if we've passed the end and need to loop back
			IF @@FETCH_STATUS <> 0  
				BEGIN
					FETCH FIRST FROM mid_cursor INTO @ID, @MailerID, @IsDefault;
				END

			-- we need to set the current mailer id as the default
			UPDATE usps.Mailers SET [IsDefaultTrackingId] = 1 WHERE [MailerId] = @MailerID;
		END

		-- update segment est qty
		UPDATE dbo.MailSegments
		SET
			MAILSEGMENT_ESTQTY = @TotalSequences
		WHERE
			MAILSEGMENT_ID = @MailingID;

		-- insert out mailsegment sequences
		INSERT INTO usps.MailSegmentSequences
		(
			SEQUENCE_CREATED
			, SEQUENCE_CREATEDBYID
			, SEQUENCE_CYCLECOUNT
			, SEQUENCE_ENDVALUE
			, SEQUENCE_INCREMENT
			, SEQUENCE_MAILERID
			, SEQUENCE_MAILINGID
			, SEQUENCE_MAXVALUE
			, SEQUENCE_MINVALUE
			, SEQUENCE_STARTVALUE
		)
		OUTPUT
			inserted.SEQUENCE_ID
			, inserted.SEQUENCE_CREATED
			, inserted.SEQUENCE_CREATEDBYID
			, inserted.SEQUENCE_CYCLECOUNT
			, inserted.SEQUENCE_ENDVALUE
			, inserted.SEQUENCE_INCREMENT
			, inserted.SEQUENCE_MAILERID
			, inserted.SEQUENCE_MAILINGID
			, inserted.SEQUENCE_MAXVALUE
			, inserted.SEQUENCE_MINVALUE
			, inserted.SEQUENCE_STARTVALUE
		SELECT
			GETUTCDATE()
			, @UserID
			, CycleCount
			, CONVERT(int, LastVal)
			, CONVERT(int, SeqIncrement)
			, MailerID
			, @MailingID
			, CONVERT(int, MaxSeq)
			, CONVERT(int, MinSeq)
			, CONVERT(int, FirstVal)
		FROM 
			@Sequences
		ORDER BY
			ROW_ID;

	COMMIT TRANSACTION

END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
        ROLLBACK;

	SELECT ERROR_NUMBER() AS ErrorNumber;
END CATCH

CLOSE mid_cursor;  
DEALLOCATE mid_cursor; 

END
GO