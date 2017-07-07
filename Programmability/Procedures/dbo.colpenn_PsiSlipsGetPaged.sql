SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_PsiSlipsGetPaged]
(
	@Page			int
	, @RowsPerPage	int 
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT 
		PSISLIP_ID
		, PSISLIP_CONTENTTYPE
		, PSISLIP_DATA
		, PSISLIP_DATE
		, PSISLIP_FILENAME
		, PSISLIP_UPLOADED
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY PSISLIP_ID) AS RESULTNUM    
			, PSISLIP_ID
			, PSISLIP_CONTENTTYPE
			, PSISLIP_DATA
			, PSISLIP_DATE
			, PSISLIP_FILENAME
			, PSISLIP_UPLOADED
		FROM
			[dbo].[colpenn_PsiSlips]		
	)
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO