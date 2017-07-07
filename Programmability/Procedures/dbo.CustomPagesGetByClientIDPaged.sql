SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CustomPagesGetByClientIDPaged]
	@ID				int,
	@Page			int,
	@RowsPerPage	int
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
	FROM 
	(
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
		WHERE CUSTOMPAGE_ID 
		IN 
		(
			SELECT
				CUSTOMPAGE_ID
			FROM 
				[dbo].[CustomPages]
			WHERE
				CUSTOMPAGE_CLIENTID = @ID			
		)
	)
	AS NumberResults
	WHERE 
		ResultNum BETWEEN @StartRow AND @EndRow		
END
GO