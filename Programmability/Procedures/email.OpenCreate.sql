SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpenCreate] 
	@AddressID				int	
	, @DateTime				datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL	
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL	
	, @IpAddressPostalCode	varchar(15) = NULL
	, @SessionID			char(24) = NULL
	, @UserAgent			nvarchar(4000) = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Opens]
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
		, SessionId
		, UserAgent
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
		, @SessionID
		, @UserAgent
	);
END
GO