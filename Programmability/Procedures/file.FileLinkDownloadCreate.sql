SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FileLinkDownloadCreate]
	@Downloaded		datetime
	, @IpAddress			varbinary(8)
	, @IpAddressCityName	nvarchar(100) = NULL
	, @IpAddressCountryCode	char(2) = NULL	
	, @IpAddressLatitude	decimal(9,6) = NULL
	, @IpAddressLongitude	decimal(9,6) = NULL
	, @IpAddressPostalCode	varchar(15) = NULL
	, @IpAddressRegionCode	char(2) = NULL		
	, @LinkID				int
	, @UserAgent			nvarchar(4000) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [file].[FileLinkDownloads]
	(
		DOWNLOAD_DATETIME
		, DOWNLOAD_IPADDRESS
		, DOWNLOAD_IPCITYNAME
		, DOWNLOAD_IPCOUNTRYCODE
		, DOWNLOAD_IPLATITUDE
		, DOWNLOAD_IPLONGITUDE
		, DOWNLOAD_IPPOSTALCODE
		, DOWNLOAD_IPREGIONCODE
		, DOWNLOAD_LINKID
		, DOWNLOAD_USERAGENT		
	)
	OUTPUT inserted.DOWNLOAD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@Downloaded
		, @IpAddress
		, @IpAddressCityName
		, @IpAddressCountryCode		
		, @IpAddressLatitude
		, @IpAddressLongitude
		, @IpAddressPostalCode
		, @IpAddressRegionCode
		, @LinkID
		, @UserAgent
	);
END
GO