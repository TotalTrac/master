﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetTotalTimeByUserID]
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
				ON u.USER_VERSIONID = v.VERSION_ID
		WHERE 
			u.[USER_ID] = @ID
	);
	
	IF @TrackAnonymous = 1
		BEGIN
			SELECT 
				COALESCE(SUM(DATEDIFF(SECOND, r.PAGEREQUEST_BEGIN, r.PAGEREQUEST_END)), 0)    
			FROM
				[web].[PageRequests] AS r
				INNER JOIN [web].[UserPageRequests] AS u
					ON r.PAGEREQUEST_ID = u.USERPAGEREQUEST_PAGEREQUESTID
			WHERE
				u.USERPAGEREQUEST_USERID = @ID;
		END
	ELSE
		BEGIN
			SELECT 
				COALESCE(SUM(DATEDIFF(SECOND, r.PAGEREQUEST_BEGIN, r.PAGEREQUEST_END)), 0)    
			FROM
				[web].[PageRequests] AS r
				INNER JOIN [web].[UserPageRequests] AS u
					ON r.PAGEREQUEST_ID = u.USERPAGEREQUEST_PAGEREQUESTID
			WHERE
				u.USERPAGEREQUEST_USERID = @ID
				AND r.PAGEREQUEST_ID IN
				(
					SELECT DISTINCT USERPAGEREQUEST_PAGEREQUESTID FROM [web].[UserPageRequests]
				);
		END
END
GO