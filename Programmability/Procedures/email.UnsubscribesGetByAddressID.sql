SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribesGetByAddressID]
	@ID	int
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
	WHERE
		AddressId = @ID
	ORDER BY 
		Id;
END
GO