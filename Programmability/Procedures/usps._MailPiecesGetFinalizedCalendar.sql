SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[_MailPiecesGetFinalizedCalendar]
	@FilterBy		int = NULL
	, @ID			int = NULL
	, @FilterBy2	int = NULL
	, @ID2			sql_variant = NULL	
	, @GroupBy		int = NULL
	, @From			datetime = NULL
	, @To			datetime = NULL
AS
BEGIN
	-- @FilterBy
	-- 1 = Client
	-- 2 = Job
	-- 3 = Mailing
	-- 4 = Segment
	-- 5 = NDC
	-- 6 = SCF

	-- @GroupBy
	-- 1 = Client
	-- 2 = Job
	-- 3 = Mailing
	-- 4 = Segment
	-- 5 = NDC
	-- 6 = SCF
	-- 7 = State
	-- 8 = 9-Digit ZIP
	-- 9 = 5-Digit ZIP
	-- 10 = 3-Digit ZIP

	SET NOCOUNT ON;

	DECLARE @sql nvarchar(MAX);

	SELECT @sql = '	
		SELECT ' +
			CASE @GroupBy
				WHEN 1 THEN
					'JOB_CLIENTID'
				WHEN 2 THEN
					'j.JOB_ID'
				WHEN 3 THEN 
					'm.JOB_ID'
				WHEN 4 THEN
					'MAILSEGMENT_ID'		
				WHEN 5 THEN
					'SCF_NDCID'
				WHEN 6 THEN
					'SCF_ID'
				WHEN 7 THEN
					'MAILPIECE_STATE'
				WHEN 8 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 9)'
				WHEN 9 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 5)'
				WHEN 10 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 3)'
				WHEN 11 THEN
					'ZIPCODE_COUNTY'
				ELSE
					'NULL'
			END + ' AS [ID]
			, [usps].[GetDeliveryDate](MAILPIECESCAN_DATETIME, OPERATION_CUTOFF) AS [DATETIME]
			, COUNT(*) AS [COUNT]			
			FROM [dbo].[MailPieces] AS p
				INNER JOIN [dbo].[MailPieceScans] AS scan
					ON p.MAILPIECE_FINALIZESCANID = scan.MAILPIECESCAN_ID
				INNER JOIN [dbo].[Operations] AS o
					ON scan.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
				INNER JOIN [dbo].[MailSegments] AS seg
							ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID';
			
			IF @GroupBy = 11 OR @FilterBy = 11 OR @FilterBy2 = 11 
				SELECT @sql = @sql + ' INNER JOIN [maponics].[ZipCodes] AS z ON p.MAILPIECE_ZIPCODE = z.ZIPCODE_ID ';

			IF @GroupBy = 5 OR @GroupBy = 6 OR @GroupBy = 7 OR
				@FilterBy = 5 OR @FilterBy = 6 OR @FilterBy = 7 OR
				@FilterBy2 = 5 OR @FilterBy2 = 6 OR @FilterBy2 = 7
				 SELECT @sql = @sql + ' INNER JOIN [dbo].[SCFs] AS scf
						ON p.MAILPIECE_SCFID = scf.SCF_ID';
							
			IF @GroupBy < 4 OR @FilterBy < 4 OR @FilterBy2 < 4
		SELECT @sql = @sql + ' 
			INNER JOIN [dbo].[Jobs] AS m
				ON seg.MAILSEGMENT_JOBID = m.JOB_ID
			INNER JOIN [job].[Jobs] AS j
				ON m.JOB_JOBID = j.JOB_ID';			
				
			IF @From IS NOT NULL AND @To IS NOT NULL
				SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME BETWEEN ''' + CONVERT(varchar, @From, 121) + ''' AND ''' + CONVERT(varchar, @To, 121) + ''')';
			ELSE IF @From IS NOT NULL
				SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME >= ''' + CONVERT(varchar, @From, 121) + ''')';
			ELSE IF @To IS NOT NULL
				SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME <= ''' + CONVERT(varchar, @To, 121) + ''')';

		IF @FilterBy IS NOT NULL AND @ID IS NOT NULL
		BEGIN
			SELECT @sql = @sql + ' AND @ID = ' +
					CASE @FilterBy			
						WHEN 1 THEN			
							'CONVERT(varchar, JOB_CLIENTID)'
						WHEN 2 THEN
							'CONVERT(varchar, j.JOB_ID)'
						WHEN 3 THEN
							'CONVERT(varchar, m.JOB_ID)'
						WHEN 4 THEN
							'CONVERT(varchar, MAILSEGMENT_ID)'
						WHEN 5 THEN
							'CONVERT(varchar, SCF_NDCID)'
						WHEN 6 THEN
							'CONVERT(varchar, SCF_ID)'						
						WHEN 7 THEN
							'MAILPIECE_STATE'
						WHEN 8 THEN
							'LEFT(MAILPIECE_ROUTINGCODE, 9)'
						WHEN 9 THEN
							'LEFT(MAILPIECE_ROUTINGCODE, 5)'
						WHEN 10 THEN
							'LEFT(MAILPIECE_ROUTINGCODE, 3)'
						WHEN 11 THEN
							'MAILPIECE_STATE + '' '' + ZIPCODE_COUNTY'
						ELSE
							'NULL'
					END

			IF @FilterBy2 IS NOT NULL AND @ID2 IS NOT NULL			
				SELECT @sql = @sql + ' AND @ID2 = '
					+ CASE @FilterBy2			
							WHEN 1 THEN			
								'CONVERT(varchar, JOB_CLIENTID)'
							WHEN 2 THEN
								'CONVERT(varchar, j.JOB_ID)'
							WHEN 3 THEN
								'CONVERT(varchar, m.JOB_ID)'
							WHEN 4 THEN
								'CONVERT(varchar, MAILSEGMENT_ID)'
							WHEN 5 THEN
								'CONVERT(varchar, SCF_NDCID)'
							WHEN 6 THEN
								'CONVERT(varchar, SCF_ID)'
							WHEN 7 THEN
								'MAILPIECE_STATE'
							WHEN 8 THEN
								'LEFT(MAILPIECE_ROUTINGCODE, 9)'
							WHEN 9 THEN
								'LEFT(MAILPIECE_ROUTINGCODE, 5)'
							WHEN 10 THEN
								'LEFT(MAILPIECE_ROUTINGCODE, 3)'
							WHEN 11 THEN
								'MAILPIECE_STATE + '' '' + ZIPCODE_COUNTY'
							ELSE
								'NULL'
					END					
			END

	IF @GroupBy IS NOT NULL
		SELECT @sql = @sql + '
		GROUP BY ' +
			CASE @GroupBy
				WHEN 1 THEN
					'JOB_CLIENTID'
				WHEN 2 THEN
					'j.JOB_ID'
				WHEN 3 THEN 
					'm.JOB_ID'
				WHEN 4 THEN
					'MAILSEGMENT_ID'		
				WHEN 5 THEN
					'SCF_NDCID'
				WHEN 6 THEN
					'SCF_ID'
				WHEN 7 THEN
					'MAILPIECE_STATE'
				WHEN 8 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 9)'
				WHEN 9 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 5)'
				WHEN 10 THEN
					'LEFT(MAILPIECE_ROUTINGCODE, 3)'
				WHEN 11 THEN
					'ZIPCODE_COUNTY'
				ELSE
					'NULL'
			END
		+ ', [usps].[GetDeliveryDate](MAILPIECESCAN_DATETIME, OPERATION_CUTOFF)';
		

			
	DECLARE @paramlist  nvarchar(4000);

	SELECT @paramlist = '@ID int, @ID2 sql_variant';

	EXEC sp_executesql @sql, @paramlist, @ID, @ID2;	

END
GO