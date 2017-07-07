SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetByPageID]
	@ID				int 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TrackAnonymous bit;
	SET @TrackAnonymous = 
	(
		SELECT 
			v.TRACKANONYMOUSEVENTS 
		FROM 
			[web].[Versions] AS v
			INNER JOIN [web].[Pages] AS p
				ON v.ID = p.PAGE_VERSIONID
		WHERE 
			p.PAGE_ID = @ID
	);
	
	IF @TrackAnonymous = 1
		SELECT 
			ID
			, [REQUESTBEGIN]
			, [REQUESTEND]
			, IPADDRESS
			, IPCITYNAME
			, IPCOUNTRYCODE
			, IPLATITUDE
			, IPLONGITUDE
			, IPREGIONCODE
			, IPPOSTALCODE
			, PAGEID
			, QRSCAN
			, REFERRER
			, SESSIONID
			, USERAGENT
			, UserId
			, [ROWVERSION]
		FROM
			[web].[PageRequests]
		WHERE
			PAGEID = @ID;
	ELSE
		SELECT 
			ID
			, REQUESTBEGIN
			, REQUESTEND
			, IPADDRESS
			, IPCITYNAME
			, IPCOUNTRYCODE
			, IPLATITUDE
			, IPLONGITUDE
			, IPREGIONCODE
			, IPPOSTALCODE
			, PAGEID
			, QRSCAN
			, REFERRER
			, SESSIONID
			, USERAGENT
			, UserId
			, [ROWVERSION]
		FROM
			[web].[PageRequests]
		WHERE
			PAGEID = @ID
			AND UserId IS NOT NULL
			--AND ID IN
			--(
			--	SELECT DISTINCT USERPAGEREQUEST_PAGEREQUESTID FROM [web].[UserPageRequests]
			--)
			;
END
GO