SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ProjectsGetByClientIDPaged] 
	@ID				int
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT 
		* 
	FROM 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY PROJECT_ID) AS ResultNum 
		, PROJECT_ID
		, PROJECT_CLIENTID
		, PROJECT_PARENTID
		, PROJECT_NAME
		, PROJECT_ROWVERSION 
	FROM 
		[dbo].[Projects]
	WHERE
		PROJECT_CLIENTID = @ID
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO