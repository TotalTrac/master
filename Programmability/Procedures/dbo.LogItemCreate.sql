SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LogItemCreate] 
	@Action					int = NULL	
	, @DateTime				datetime
	, @IpAddress			varbinary(8) = NULL
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressRegionCode	char(2) = NULL	
	, @IpAddressPostalCode	varchar(15) = NULL
	, @Message				nvarchar(500)
	, @Query				nvarchar(2000) = NULL
	, @Screen				varchar(200) = NULL
	, @ServerName			nvarchar(50)
	, @SessionID			nvarchar(24) = NULL
	, @Severity				int
	, @Url					nvarchar(2000) = NULL
	, @UserAgent			nvarchar(500) = NULL
	, @UserAgentFingerprint	char(32) = NULL
	, @UserID				int = NULL
	
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[Log] 
	(
		LOG_ACTION
		, LOG_DATETIME
		, LOG_IPADDRESS
		, LOG_IPCITYNAME
		, LOG_IPCOUNTRYCODE
		, LOG_IPLATITUDE
		, LOG_IPLONGITUDE
		, LOG_IPPOSTALCODE
		, LOG_IPREGIONCODE
		, LOG_MESSAGE
		, LOG_QUERY
		, LOG_SCREEN
		, LOG_SERVERNAME
		, LOG_SESSIONID
		, LOG_SEVERITY
		, LOG_URL
		, LOG_USERAGENT
		, LOG_USERAGENTFINGERPRINT
		, LOG_USERID
	)
	OUTPUT
		inserted.LOG_ID AS ID, NULL AS [VERSION]	
	VALUES
	(
		@Action
		, @DateTime		
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressPostalCode
		, @IpAddressRegionCode
		, @Message
		, @Query
		, @Screen
		, @ServerName
		, @SessionID
		, @Severity
		, @Url
		, @UserAgent
		, @UserAgentFingerprint
		, @UserID
	);
END
GO