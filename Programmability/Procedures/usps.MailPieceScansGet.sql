SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceScansGet] 
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
		, MAILPIECESCAN_MAILPIECEID
		, MAILPIECESCAN_OPERATIONID
	FROM [dbo].[MailPieceScans] AS scan
		INNER JOIN [dbo].[MailPieces] AS p				
			ON scan.MAILPIECESCAN_MAILPIECEID = p.MAILPIECE_ID';
			
	IF @FilterBy = 11 OR @FilterBy2 = 11 
		SELECT @sql = @sql + ' INNER JOIN [maponics].[ZipCodes] AS z ON p.MAILPIECE_ZIPCODE = z.ZIPCODE_ID ';

	IF 	@FilterBy = 5 OR @FilterBy = 6 OR @FilterBy = 7 OR
		@FilterBy2 = 5 OR @FilterBy2 = 6 OR @FilterBy2 = 7
			SELECT @sql = @sql + ' INNER JOIN [dbo].[SCFs] AS scf
				ON p.MAILPIECE_SCFID = scf.SCF_ID';

	IF @FilterBy < 5 OR @FilterBy2 < 5
		SELECT @sql = @sql + ' INNER JOIN [dbo].[MailSegments] AS seg
			ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID';
							
	IF @FilterBy = 3 OR @FilterBy2 = 3
		SELECT @sql = @sql + ' INNER JOIN [dbo].[Jobs] AS m
				ON seg.MAILSEGMENT_JOBID = m.JOB_ID';

	IF @FilterBy < 3 OR @FilterBy2 < 3
		SELECT @sql = @sql + ' INNER JOIN [job].[Jobs] AS j
				ON m.JOB_JOBID = j.JOB_ID';		

	IF @FilterBy IS NOT NULL AND @ID IS NOT NULL
		BEGIN
			SELECT @sql = @sql + ' AND @ID = '
				+ CASE @FilterBy			
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
								'MAILPIECE_ZIPCODE + MAILPIECE_ZIPCODEEXT' --'LEFT(MAILPIECE_ROUTINGCODE, 9)'
							WHEN 9 THEN
								'MAILPIECE_ZIPCODE' --'LEFT(MAILPIECE_ROUTINGCODE, 5)'
							WHEN 10 THEN
								'LEFT(MAILPIECE_ZIPCODE, 3)' -- 'LEFT(MAILPIECE_ROUTINGCODE, 3)'
							WHEN 11 THEN 
								'MAILPIECE_STATE + '' '' + ZIPCODE_COUNTY'
							WHEN 12 THEN
								'MAILPIECE_ID'
							ELSE
								'NULL'
					END					
		END;
				
						
	DECLARE @paramlist  nvarchar(4000);

	SELECT @paramlist = '@ID int, @ID2  sql_variant';

	EXEC sp_executesql @sql, @paramlist, @ID, @ID2;	
END
GO