SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGet]
	
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
	FROM 
		[email].[Unsubscribes]
	ORDER BY 
		Id;
END
GO