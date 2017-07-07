SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsGetByClientIDsPaged]
	@IDs			varchar(100),
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY p.PROJECT_ID DESC) AS ResultNum, 
			p.PROJECT_ID
			, p.PROJECT_CLIENTID
			, p.PROJECT_NAME
			, p.PROJECT_PARENTID
			, p.PROJECT_ROWVERSION
		FROM [dbo].[Projects] AS p
		WHERE p.PROJECT_ID IN (
			SELECT
				p.PROJECT_ID
			FROM 
				[dbo].[Projects] AS p
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON p.PROJECT_CLIENTID = i.number
			))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO