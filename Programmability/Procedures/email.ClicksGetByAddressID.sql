SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetByAddressID]
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
	WHERE
		AddressId = @ID
	ORDER BY 
		Id;
END
GO