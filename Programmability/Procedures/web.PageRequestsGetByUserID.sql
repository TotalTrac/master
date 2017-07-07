﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetByUserID]
	@ID	int 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TrackAnonymous bit;
	SET @TrackAnonymous = 
	(
		SELECT 
			c.CAMPAIGN_TRACKANONYMOUSEVENTS 
		FROM 
			[web].[Campaigns] AS c
			INNER JOIN [web].[Versions] AS v
				ON c.CAMPAIGN_ID = v.VERSION_CAMPAIGNID
			INNER JOIN [web].[Users] AS u
				ON v.VERSION_ID = u.USER_VERSIONID
		WHERE 
			u.[USER_ID] = @ID
	);
	
	IF @TrackAnonymous = 1	
		SELECT 
			r.PAGEREQUEST_ID
			, r.PAGEREQUEST_BEGIN
			, r.PAGEREQUEST_END
			, r.PAGEREQUEST_IPADDRESS
			, r.PAGEREQUEST_IPCITYNAME
			, r.PAGEREQUEST_IPCOUNTRYCODE
			, r.PAGEREQUEST_IPLATITUDE
			, r.PAGEREQUEST_IPLONGITUDE
			, r.PAGEREQUEST_IPREGIONCODE
			, r.PAGEREQUEST_IPPOSTALCODE
			, r.PAGEREQUEST_PAGEID
			, r.PAGEREQUEST_QRSCAN
			, r.PAGEREQUEST_REFERRER
			, r.PAGEREQUEST_SESSIONID
			, r.PAGEREQUEST_USERAGENT
			, r.PAGEREQUEST_ROWVERSION
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[UserPageRequests] AS u
				ON r.PAGEREQUEST_ID = u.USERPAGEREQUEST_PAGEREQUESTID
		WHERE
			u.USERPAGEREQUEST_USERID = @ID
		ORDER BY
			PAGEREQUEST_ID;
	ELSE
		SELECT 
			r.PAGEREQUEST_ID
			, r.PAGEREQUEST_BEGIN
			, r.PAGEREQUEST_END
			, r.PAGEREQUEST_IPADDRESS
			, r.PAGEREQUEST_IPCITYNAME
			, r.PAGEREQUEST_IPCOUNTRYCODE
			, r.PAGEREQUEST_IPLATITUDE
			, r.PAGEREQUEST_IPLONGITUDE
			, r.PAGEREQUEST_IPREGIONCODE
			, r.PAGEREQUEST_IPPOSTALCODE
			, r.PAGEREQUEST_PAGEID
			, r.PAGEREQUEST_QRSCAN
			, r.PAGEREQUEST_REFERRER
			, r.PAGEREQUEST_SESSIONID
			, r.PAGEREQUEST_USERAGENT
			, r.PAGEREQUEST_ROWVERSION
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[UserPageRequests] AS u
				ON r.PAGEREQUEST_ID = u.USERPAGEREQUEST_PAGEREQUESTID
		WHERE
			u.USERPAGEREQUEST_USERID = @ID
			AND r.PAGEREQUEST_ID IN
			(
				SELECT DISTINCT USERPAGEREQUEST_PAGEREQUESTID FROM [web].[UserPageRequests]
			)
		ORDER BY
			PAGEREQUEST_ID;			
END
GO