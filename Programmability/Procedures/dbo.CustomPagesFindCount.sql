SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesFindCount]		
	@ClientIDs		varchar(100) = NULL
	, @Description		nvarchar(2000) = NULL	
	, @Title			nvarchar(200) = NULL	
	, @Url				nvarchar(2000) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		COUNT(CUSTOMPAGE_ID)		
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
END
GO