SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpensGetDistinctByVersionID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 			
		Id 
		, AddressId
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
		[email].[Opens]
	WHERE Id IN 
	(
		SELECT
			Min(o.Id)
		FROM 
			[email].[Opens] AS o 
			INNER JOIN [email].[Addresses] AS a
				ON o.AddressId = a.Id
			INNER JOIN [dbo].[CampaignUsers] AS c
				ON a.TargetId = c.Id
			INNER JOIN [email].[Versions] AS v
				ON a.VersionId = v.Id
		WHERE
			v.Id = @ID AND c.IsSignoff = 0
		GROUP BY
			o.AddressId
	);
END
GO