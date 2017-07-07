SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignGetByID]
	@ID int
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
	WHERE 
		Id = @ID;
END
GO