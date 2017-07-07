SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetDistinctByAddressID] 
	@ID	int
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
	WHERE Id IN 
	(
		SELECT
			Min(c.Id)
		FROM 
			[email].[Clicks] AS c
		GROUP BY
			c.AddressId
	);
END
GO