SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesGetByClientIDsPaged]
	@IDs			varchar(100)
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT
		CUSTOMPAGE_ID
		, CUSTOMPAGE_CLIENTID
		, CUSTOMPAGE_DESCRIPTION
		, CUSTOMPAGE_TITLE
		, CUSTOMPAGE_URL
		, CUSTOMPAGE_ROWVERSION
	FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY CUSTOMPAGE_ID DESC) AS ResultNum
			, CUSTOMPAGE_ID
			, CUSTOMPAGE_CLIENTID
			, CUSTOMPAGE_DESCRIPTION
			, CUSTOMPAGE_TITLE
			, CUSTOMPAGE_URL
			, CUSTOMPAGE_ROWVERSION
		FROM 
			[dbo].[CustomPages]
		WHERE CUSTOMPAGE_ID IN (
			SELECT
				c.CUSTOMPAGE_ID
			FROM 
				[dbo].[CustomPages] AS c
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON c.CUSTOMPAGE_CLIENTID = i.number
			))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO