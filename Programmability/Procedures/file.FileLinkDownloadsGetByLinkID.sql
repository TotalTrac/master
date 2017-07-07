﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FileLinkDownloadsGetByLinkID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		DOWNLOAD_ID
		, DOWNLOAD_DATETIME
		, DOWNLOAD_IPADDRESS
		, DOWNLOAD_IPCITYNAME
		, DOWNLOAD_IPCOUNTRYCODE
		, DOWNLOAD_IPLATITUDE
		, DOWNLOAD_IPLONGITUDE
		, DOWNLOAD_IPPOSTALCODE
		, DOWNLOAD_IPREGIONCODE
		, DOWNLOAD_LINKID
		, DOWNLOAD_USERAGENT
	FROM
		[file].[FileLinkDownloads]
	WHERE
		DOWNLOAD_LINKID = @ID;
END
GO