SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClickCreate] 
	@AddressID				int
	, @VersionLinkID		int
	, @DateTime				datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL	
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressPostalCode	varchar(15) = NULL
	, @IpAddressRegionCode	char(2) = NULL		
	, @SessionID			char(24) = NULL
	, @UserAgent			nvarchar(4000)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Clicks]
	(
		AddressId
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
		
	)
	OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
	VALUES
	(
		@AddressID
		, @VersionLinkID
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