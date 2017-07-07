SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[UnsubscribeCreate] 
	@AddressID				int	
	, @DateTime				datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL	
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL	
	, @IpAddressPostalCode	varchar(15) = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Unsubscribes]
	(
		AddressId
		, [DateTime]
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpRegionCode
		, IpPostalCode		
	)
	OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
	VALUES
	(
		@AddressID		
		, @DateTime
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode		
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressRegionCode		
		, @IpAddressPostalCode
	);
END
GO