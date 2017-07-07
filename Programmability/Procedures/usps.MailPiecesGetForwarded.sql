SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPiecesGetForwarded] 
	@FilterBy		int = NULL
	, @ID			int = NULL
	, @FilterBy2	int = NULL
	, @ID2			sql_variant = NULL		
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

	SET NOCOUNT ON;

	DECLARE @sql nvarchar(MAX);

	SELECT @sql = 'SELECT
		MAILPIECE_ID
		, MAILPIECE_ADDRESS1
		, MAILPIECE_ADDRESS2
		, MAILPIECE_ADDRESS3
		, MAILPIECE_CITY
		, MAILPIECE_COMPANY
		, MAILPIECE_CRRT
		, MAILPIECE_DELIVERYDATE
		, MAILPIECE_FIRSTNAME
		, MAILPIECE_FINALIZESCANID
		, MAILPIECE_FIRSTSCANID
		, MAILPIECE_FORWARDSCANID  
		, MAILPIECE_GROUPID
		, MAILPIECE_INDIVIDUALID
		, MAILPIECE_LASTNAME
		, MAILPIECE_LASTSCANID
		, MAILPIECE_ROUTINGCODE
		, MAILPIECE_SCFID
		, MAILPIECE_SEGMENTID
		, MAILPIECE_RETURNSCANID
		, MAILPIECE_STATE
		, MAILPIECE_TARGETID
		, MAILPIECE_TITLE
		, MAILPIECE_TRACKINGCODE
		, MAILPIECE_ZIPCODE
		, MAILPIECE_ZIPCODEEXT
	FROM [dbo].[MailPieces] AS p		
		INNER JOIN [dbo].[MailSegments] AS seg
			ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID';
			
	IF @From IS NOT NULL OR @To IS NOT NULL
		SELECT @sql = @sql + ' INNER JOIN [dbo].[MailPieceScans] AS scan ON p.MAILPIECE_FORWARDSCANID = scan.MAILPIECESCAN_ID';

	IF @FilterBy = 11 OR @FilterBy2 = 11 
		SELECT @sql = @sql + ' INNER JOIN [maponics].[ZipCodes] AS z ON x.MAILPIECE_ZIPCODE = z.ZIPCODE_ID ';

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

	-- WHERE CLAUSE
	SELECT @sql = @sql + ' WHERE p.MAILPIECE_FORWARDSCANID IS NOT NULL ';

	IF @From IS NOT NULL AND @To IS NOT NULL
		SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME BETWEEN ''' + CONVERT(varchar, @From, 121) + ''' AND ''' + CONVERT(varchar, @To, 121) + ''')';
	ELSE IF @From IS NOT NULL
		SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME >= ''' + CONVERT(varchar, @From, 121) + ''')';
	ELSE IF @To IS NOT NULL
		SELECT @sql = @sql + ' AND (MAILPIECESCAN_DATETIME <= ''' + CONVERT(varchar, @To, 121) + ''')';

	IF @FilterBy IS NOT NULL AND @ID IS NOT NULL
		BEGIN
			SELECT @sql = @sql + ' AND @ID = '
				+ CASE @FilterBy			
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
				ELSE
					'NULL'
		END					
	END;
						
	DECLARE @paramlist  nvarchar(4000);

	SELECT @paramlist = '@ID int, @ID2  sql_variant';

	EXEC sp_executesql @sql, @paramlist, @ID, @ID2;	
END
GO