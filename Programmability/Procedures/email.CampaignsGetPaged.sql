SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetPaged]
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
		Id
		, CampaignId
		, ClientId
		, Created
		, Name
		, [RowVersion]			
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY Id) AS ResultNum 
			, Id
			, CampaignId
			, ClientId
			, Created
			, Name
			, [RowVersion]
		FROM 
			[email].[Campaigns]
	) AS c	
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO