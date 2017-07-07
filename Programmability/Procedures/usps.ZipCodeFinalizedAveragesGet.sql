SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[ZipCodeFinalizedAveragesGet]
	@ZipCode			int = NULL
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
		ZipCode AS [ID]
		, EntryPoint AS [ENTRYPOINT]
		, PostalClassID AS [POSTALCLASSID]
		, CONVERT(bigint, SUM(Pieces)) AS [PIECES]
		, CASE @GroupBy
			WHEN 0 THEN
				CONVERT(nvarchar, CONVERT(DATE, ScanDate))
			WHEN 1 THEN
				CONVERT(nvarchar, DATEPART(YEAR, ScanDate)) + '-' + REPLACE(STR(CONVERT(nvarchar,DATEPART(MONTH, ScanDate)), 2), SPACE(1), '0') 
			WHEN 2 THEN
				CONVERT(nvarchar, DATEPART(YEAR, ScanDate))
		  END AS [DATE]		
		, CONVERT(bigint, (SUM(Pieces * AverageHours) / SUM (Pieces))) AS [AVERAGEHOURS]
	FROM
		[usps].[ZipCodeFinalizedAverages]
	WHERE
		(@ZipCode IS NULL OR ZipCode = @ZipCode)
		AND EntryPoint = @EntryPoint
		AND ScanDate BETWEEN @From AND @To
		AND (@PostalClassID IS NULL OR @PostalClassID = PostalClassID)
	GROUP BY
		ZipCode
		, EntryPoint
		,  CASE @GroupBy
			WHEN 0 THEN
				CONVERT(nvarchar, CONVERT(DATE, ScanDate))
			WHEN 1 THEN
				CONVERT(nvarchar, DATEPART(YEAR, ScanDate)) + '-' + REPLACE(STR(CONVERT(nvarchar,DATEPART(MONTH, ScanDate)), 2), SPACE(1), '0') 
			WHEN 2 THEN
				CONVERT(nvarchar, DATEPART(YEAR, ScanDate))
		  END
		, PostalClassID
	
END
GO