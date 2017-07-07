SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		c.Id 
		, c.AddressId
		, c.LinkId
		, c.[DateTime]
		, c.IpAddress
		, c.IpCityName
		, c.IpCountryCode
		, c.IpLatitude
		, c.IpLongitude
		, c.IpRegionCode
		, c.IpPostalCode
		, c.SessionId
		, c.UserAgent 
	FROM [email].[Clicks] AS c
		INNER JOIN [email].[Addresses] as a
			ON c.AddressId = a.Id		
		INNER JOIN [dbo].[CampaignUsers] cu
			ON a.TargetId = cu.Id	
		INNER JOIN [email].[Links] AS l
			ON c.LinkId = l.Id
		INNER JOIN [email].[Versions] AS v
			ON l.[VersionId] = v.Id
	WHERE
		v.Id = @ID AND cu.IsSignoff = 0;
END
GO