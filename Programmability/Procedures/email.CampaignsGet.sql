SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id	
		, CampaignId	
		, ClientId
		, Created
		, Name
		, [RowVersion] 
	FROM 
		[email].[Campaigns]
	ORDER BY 
		Id DESC;	
END
GO