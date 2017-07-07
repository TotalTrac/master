SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClickCreate] 
	@DateTime				datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL	
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL	
	, @IpAddressPostalCode	varchar(15) = NULL
	, @ButtonID				int
	, @SessionID			char(24)
	, @UserAgent			nvarchar(4000)
	, @UserID				int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [web].[ButtonClicks]
    (
		ButtonId
		, [DateTime]
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude		
		, IpPostalCode
		, IpRegionCode
		, SessionId
		, UserAgent
		, UserId
    )
    OUTPUT
		inserted.Id AS ID, NULL AS [VERSION]
    VALUES
    (
		@ButtonID
		, @DateTime
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressPostalCode
		, @IpAddressRegionCode
		, @SessionID
		, @UserAgent
		, @UserID
    );    
END
GO