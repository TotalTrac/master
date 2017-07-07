SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGetCountByVersionID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(u.Id) 
    FROM 
		[email].[Unsubscribes] AS u
		INNER JOIN [email].[Addresses] AS a
			ON u.AddressId = a.Id			
		INNER JOIN [dbo].[CampaignUsers] cu
			ON a.TargetId = cu.Id	
		INNER JOIN [email].[Versions] AS v
			ON a.VersionId = v.Id
	WHERE
		v.Id = @ID AND cu.IsSignoff = 0;
END
GO