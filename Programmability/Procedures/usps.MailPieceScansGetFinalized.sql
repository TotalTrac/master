SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceScansGetFinalized] 
	@FilterBy		int = NULL
	, @ID			int = NULL
	, @FilterBy2	int = NULL
	, @ID2			sql_variant = NULL		
AS
BEGIN
	-- @FilterBy
	-- 1 = Client
	-- 2 = Job
	-- 3 = Mailing
	-- 4 = Segment
	-- 5 = NDC
	-- 6 = SCF
	-- 7 = ByState
    -- 8 = By9DigitZipCode
    -- 9 = By5DigitZipCode
    -- 10 = By3DigitZipCode
	-- 11 = County
    -- 12 = ByMailPiece
	
	SET NOCOUNT ON;
    
	DECLARE @sql nvarchar(MAX);

	SELECT @sql = 'SELECT
		MAILPIECESCAN_ID
		, MAILPIECESCAN_CREATED
		, MAILPIECESCAN_DATETIME
		, MAILPIECESCAN_FACILITYID
		, MAILPIECE_ID AS [MAILPIECESCAN_MAILPIECEID]
		, OPERATION_ID AS [MAILPIECESCAN_OPERATIONID]
	FROM [dbo].[MailPieces] AS p
		INNER JOIN [dbo].[MailPieceScans] AS scan
			ON scan.MAILPIECESCAN_ID = p.MAILPIECE_FINALIZESCANID
		INNER JOIN [dbo].[Operations] AS o
			ON o.OPERATION_ID = scan.MAILPIECESCAN_OPERATIONID		
		INNER JOIN [dbo].[MailSegments] AS seg
			ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID';
			
	IF @FilterBy = 11 OR @FilterBy2 = 11 
		SELECT @sql = @sql + ' INNER JOIN [maponics].[ZipCodes] AS z ON p.MAILPIECE_ZIPCODE = z.ZIPCODE_ID ';

	IF 	@FilterBy = 5 OR @FilterBy = 6 OR @FilterBy = 7 OR
		@FilterBy2 = 5 OR @FilterBy2 = 6 OR @FilterBy2 = 7
			SELECT @sql = @sql + ' INNER JOIN [dbo].[SCFs] AS scf
				ON p.MAILPIECE_SCFID = scf.SCF_ID';
							
	IF @FilterBy < 4 OR @FilterBy2 < 4
		SELECT @sql = @sql + ' 
			INNER JOIN [dbo].[Jobs] AS m
				ON seg.MAILSEGMENT_JOBID = m.JOB_ID
			INNER JOIN [job].[Jobs] AS j
				ON m.JOB_JOBID = j.JOB_ID';	
		
	IF @FilterBy = 11 OR @FilterBy2 = 11		
		SELECT @sql = @sql + ' INNER JOIN [maponics].[ZipCodes] AS z ON p.MAILPIECE_ZIPCODE = z.ZIPCODE_ID'; 
	
	IF @FilterBy IS NOT NULL AND @ID IS NOT NULL	
		BEGIN
			SELECT @sql = @sql + ' AND @ID = '
				+  CASE @FilterBy			
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
					'MAILPIECE_ZIPCODE + MAILPIECE_ZIPCODEEXT' --'LEFT(MAILPIECE_ROUTINGCODE, 9)'
				WHEN 9 THEN
					'MAILPIECE_ZIPCODE' --'LEFT(MAILPIECE_ROUTINGCODE, 5)'
				WHEN 10 THEN
					'LEFT(MAILPIECE_ZIPCODE, 3)' -- 'LEFT(MAILPIECE_ROUTINGCODE, 3)'
				WHEN 11 THEN 
					'MAILPIECE_STATE + '' '' + ZIPCODE_COUNTY'
				WHEN 12 THEN
					'MAILPIECE_ID'	
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
					'MAILPIECE_ZIPCODE + MAILPIECE_ZIPCODEEXT' --'LEFT(MAILPIECE_ROUTINGCODE, 9)'
				WHEN 9 THEN
					'MAILPIECE_ZIPCODE' --'LEFT(MAILPIECE_ROUTINGCODE, 5)'
				WHEN 10 THEN
					'LEFT(MAILPIECE_ZIPCODE, 3)' -- 'LEFT(MAILPIECE_ROUTINGCODE, 3)'
				WHEN 11 THEN 
					'MAILPIECE_STATE + '' '' + ZIPCODE_COUNTY'
				WHEN 12 THEN
					'MAILPIECE_ID'
			END
		END 		
						
	DECLARE @paramlist  nvarchar(4000);

	SELECT @paramlist = '@ID int, @ID2  sql_variant';

	EXEC sp_executesql @sql, @paramlist, @ID, @ID2;
END
GO