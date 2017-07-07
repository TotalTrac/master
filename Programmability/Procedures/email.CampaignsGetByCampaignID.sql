SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetByCampaignID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    	
	SELECT 
		e.Id
		, e.CampaignId
		, e.ClientId
		, e.Created
		, e.Name
		, e.[RowVersion]
	FROM 
		[email].[Campaigns] AS e	
	WHERE
		e.CampaignId = @ID
	ORDER BY
		Id;
END
GO