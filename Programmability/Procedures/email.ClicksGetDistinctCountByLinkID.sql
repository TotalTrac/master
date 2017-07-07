SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctCountByLinkID] 
	@ID	int
AS
BEGIN
	SELECT 
		COUNT(DISTINCT(c.AddressId)) 
	FROM 
		[email].[Clicks] c
	INNER JOIN [email].[Addresses] a
		ON c.AddressId = a.Id
	INNER JOIN [dbo].[CampaignUsers] cu
		ON a.TargetId = cu.Id		
	WHERE 
		LinkId = @ID 
		AND cu.IsSignoff = 0;
END
GO