SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesFindPaged]
	@Page				int
	, @RowsPerPage		int	
	, @ClientIDs		varchar(100) = NULL
	, @Description		nvarchar(2000) = NULL	
	, @Title			nvarchar(200) = NULL	
	, @Url				nvarchar(2000) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT * FROM (
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
	WHERE
		(@ClientIDs IS NULL OR @ClientIDs = '' OR CUSTOMPAGE_ID IN (
		SELECT
			CUSTOMPAGE_ID
		FROM 
			[dbo].[CustomPages] AS c
			INNER JOIN IntegerListToTable(@ClientIDs) AS i 
				ON c.CUSTOMPAGE_CLIENTID = i.number
		))	
	AND		
		 (@Description IS NULL OR @Description = '' OR CUSTOMPAGE_DESCRIPTION LIKE '%' + @Description + '%')
		 AND (@Title IS NULL OR @Title = '' OR CUSTOMPAGE_TITLE LIKE '%' + @Title + '%')
		 AND (@Url IS NULL OR @Url = '' OR CUSTOMPAGE_URL LIKE '%' + @Url + '%')
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;		
END
GO