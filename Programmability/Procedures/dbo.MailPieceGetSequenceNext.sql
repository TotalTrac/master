SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceGetSequenceNext]
	@MailerID	int	
AS
BEGIN
	SET NOCOUNT ON;

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
    
	DECLARE  
		  @FirstSeqNum sql_variant
		, @LastSeqNum sql_variant
		, @CycleCount int
		, @SeqIncr sql_variant
		, @SeqMinVal sql_variant
		, @SeqMaxVal sql_variant;

	EXEC sys.sp_sequence_get_range
		@sequence_name = @SequenceName
		, @range_size = 1
		, @range_first_value = @FirstSeqNum OUTPUT 
		, @range_last_value = @LastSeqNum OUTPUT 
		, @range_cycle_count = @CycleCount OUTPUT
		, @sequence_increment = @SeqIncr OUTPUT
		, @sequence_min_value = @SeqMinVal OUTPUT
		, @sequence_max_value = @SeqMaxVal OUTPUT;

	SELECT
		  @FirstSeqNum AS FirstVal
		, @LastSeqNum AS LastVal
		, @CycleCount AS CycleCount
		, @SeqIncr AS SeqIncrement
		, @SeqMinVal AS MinSeq
		, @SeqMaxVal AS MaxSeq;
END
GO