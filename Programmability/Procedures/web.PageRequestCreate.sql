SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestCreate] 
	@Begin					datetime
	, @End					datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL
	, @IpAddressPostalCode	varchar(15) = NULL
	, @PageID				int
	, @QrScan				bit	= NULL
	, @Referrer				nvarchar(400) = NULL
	, @SessionID			char(24) = NULL
	, @UserAgent			nvarchar(4000) = NULL
	, @UserId				int = NULL
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [web].[PageRequests]
    (
		RequestBegin
		, RequestEnd
		, IpAddress
		, IpCityName
		, IpCountryCode
		, IpLatitude
		, IpLongitude
		, IpRegionCode
		, IpPostalCode
		, PageId
		, QrScan
		, Referrer
		, SessionId
		, UserAgent
		, UserId
    )
    OUTPUT
		inserted.[Id] AS ID, inserted.[RowVersion] AS [VERSION]
    VALUES
    (
		@Begin
		, @End
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressRegionCode
		, @IpAddressPostalCode		
		, @PageID
		, @QrScan
		, @Referrer
		, @SessionID
		, @UserAgent
		, @UserId
    );    
END
GO