SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		u.Id 
		, u.AddressId
		, u.[DateTime]
		, u.IpAddress
		, u.IpCityName
		, u.IpCountryCode
		, u.IpLatitude
		, u.IpLongitude
		, u.IpRegionCode
		, u.IpPostalCode
	FROM 
		[email].[Unsubscribes] AS u
		INNER JOIN [email].[Addresses] AS a
			ON u.AddressId = a.Id		
		INNER JOIN [dbo].[CampaignUsers] cu
			ON a.TargetId = cu.Id	
		INNER JOIN [email].[Versions] AS v
			ON a.VersionId = v.Id
	WHERE
		v.Id = @ID AND cu.IsSignoff = 0
	ORDER BY 
		u.Id;
END
GO