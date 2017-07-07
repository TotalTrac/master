SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribeGetByID]
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
		Id = @ID;
END
GO