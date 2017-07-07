SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[ScfFinalizedAveragesGet]
	@NdcID				int = NULL
	, @EntryPoint		char(5)
	, @From				date
	, @To				date
	, @GroupBy			int
	, @PostalClassID	int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	-- @GroupBy
	-- 0 = Day
	-- 1 = Month
	-- 2 = Year
	
	SELECT
		a.SCF_ID AS [ID]
		, SCF_ENTRYPOINT AS [ENTRYPOINT]
		, SCF_POSTALCLASSID AS [POSTALCLASSID]
		, SUM(SCF_PIECES) AS [PIECES]
		, CASE @GroupBy
			WHEN 0 THEN
				CONVERT(nvarchar, CONVERT(DATE, SCF_SCANDATE))
			WHEN 1 THEN
				CONVERT(nvarchar, DATEPART(YEAR, SCF_SCANDATE)) + '-' + REPLACE(STR(CONVERT(nvarchar,DATEPART(MONTH, SCF_SCANDATE)), 2), SPACE(1), '0') 
			WHEN 2 THEN
				CONVERT(nvarchar, DATEPART(YEAR, SCF_SCANDATE))
		  END AS [DATE]		
		, (SUM(SCF_PIECES * SCF_AVERAGEHOURS) / SUM (SCF_PIECES)) AS [AVERAGEHOURS]
	FROM
		[usps].[ScfFinalizedAverages] AS a
		INNER JOIN [dbo].SCFs AS s
			ON a.SCF_ID = s.SCF_ID
	WHERE		
		(@NdcID IS NULL OR @NdcID = s.SCF_NDCID)
		AND SCF_ENTRYPOINT = @EntryPoint
		AND SCF_SCANDATE BETWEEN @From AND @To
		AND (@PostalClassID IS NULL OR @PostalClassID = SCF_POSTALCLASSID)
	GROUP BY
		a.SCF_ID
		, SCF_ENTRYPOINT
		,  CASE @GroupBy
			WHEN 0 THEN
				CONVERT(nvarchar, CONVERT(DATE, SCF_SCANDATE))
			WHEN 1 THEN
				CONVERT(nvarchar, DATEPART(YEAR, SCF_SCANDATE)) + '-' + REPLACE(STR(CONVERT(nvarchar,DATEPART(MONTH, SCF_SCANDATE)), 2), SPACE(1), '0') 
			WHEN 2 THEN
				CONVERT(nvarchar, DATEPART(YEAR, SCF_SCANDATE))
		  END
		, SCF_POSTALCLASSID
	
END
GO