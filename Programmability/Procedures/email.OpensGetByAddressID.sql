SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpensGetByAddressID]
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
		, SessionId
		, UserAgent 
	FROM 
		[email].[Opens]
	WHERE
		AddressId = @ID
	ORDER BY 
		Id;
END
GO