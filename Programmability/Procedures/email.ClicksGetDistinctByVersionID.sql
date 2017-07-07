SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctByVersionID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 			
		Id 
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
		[email].[Clicks]
	WHERE Id IN (
		SELECT
			Min(c.Id)
		FROM 
			[email].[Clicks] AS c 
			INNER JOIN [email].[Addresses] AS a
				ON c.AddressId = a.Id
			INNER JOIN [dbo].[CampaignUsers] cu
				ON a.TargetId = cu.Id	
			INNER JOIN [email].[Versions] AS v
				ON a.VersionId = v.Id
		WHERE
			v.Id = @ID
			AND cu.IsSignoff = 0
		GROUP BY
			c.AddressId
	)
END
GO