SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetByLinkID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		c.Id
		, AddressId
		, LinkId
		, [DateTime]
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpRegionCode
		, IpPostalCode
		, SessionId
		, UserAgent 
	FROM 
		[email].[Clicks] c
	INNER JOIN [email].[Addresses] AS a
		ON a.Id = c.AddressId
	INNER JOIN [dbo].[CampaignUsers] AS cu
		ON a.TargetId = cu.Id
	WHERE
		LinkId = @ID 
		AND cu.IsSignoff = 0
	ORDER BY 
		c.Id;
END
GO