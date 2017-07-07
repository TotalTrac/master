SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGet]
	
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
	ORDER BY 
		Id;
END
GO