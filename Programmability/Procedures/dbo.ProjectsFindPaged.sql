SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsFindPaged]
	@Page				int
	, @RowsPerPage		int	
	, @ClientIDs		varchar(100) = NULL
	, @Name				nvarchar(100) = NULL
	, @ProjectIDs			varchar(100) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY p.PROJECT_ID) AS ResultNum 		
			, p.PROJECT_ID
			, p.PROJECT_CLIENTID
			, p.PROJECT_NAME
			, p.PROJECT_PARENTID
			, p.PROJECT_ROWVERSION
		FROM 
			[dbo].[Projects] AS p
		WHERE
			(@ClientIDs IS NULL OR @ClientIDs = '' OR PROJECT_ID IN (
			SELECT
				PROJECT_ID
			FROM 
				[dbo].[Projects] AS p
				INNER JOIN IntegerListToTable(@ClientIDs) AS ids 
					ON p.PROJECT_CLIENTID = ids.number
			))
		AND
			(@ProjectIDs IS NULL OR @ProjectIDs = '' OR PROJECT_ID IN (
			SELECT
				PROJECT_ID
			FROM 
				[dbo].[Projects] AS p
				INNER JOIN IntegerListToTable(@ProjectIDs) AS ids 
					ON p.PROJECT_PARENTID = ids.number
			))		
		AND
			(@Name IS NULL OR @Name = '' OR PROJECT_NAME LIKE '%' + @Name + '%')			 
		) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;		
END
GO