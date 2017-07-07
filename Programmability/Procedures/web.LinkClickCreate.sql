SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClickCreate] 
	@DateTime				datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL	
	, @IpAddressPostalCode	varchar(15) = NULL
	, @LinkID				int
	, @SessionID			char(24) = NULL
	, @UserAgent			nvarchar(4000) = NULL
	, @UserID				int = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [web].[LinkClicks]
    (
		[DateTime]
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpPostalCode
		, IpRegionCode
		, LinkId
		, SessionId
		, UserAgent
		, UserId
    )
    OUTPUT
		inserted.[Id] AS ID, NULL AS [VERSION]
    VALUES
    (
		@DateTime
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode
		, @IpAddressLatitude		
		, @IpAddressLongitude
		, @IpAddressPostalCode
		, @IpAddressRegionCode		
		, @LinkID
		, @SessionID
		, @UserAgent
		, @UserID
    );    
END
GO