SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetByClientIDPaged]
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
		Id		
		, CampaignId
		, ClientId
		, Created
		, Name
		, [RowVersion] 
	FROM 
	(
		SELECT
			ROW_NUMBER() OVER (ORDER BY c.Id DESC) AS ResultNum 
			, c.Id	
			, c.CampaignId		
			, c.ClientId
			, c.Created
			, c.Name
			, c.[RowVersion]			
		FROM 
			[email].[Campaigns] AS c
		WHERE
			c.ClientId = @ID
	) AS c
	WHERE 
		ResultNum BETWEEN @StartRow AND @EndRow		
END
GO