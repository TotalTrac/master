SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetCountByUserID]
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
		BEGIN		
			SELECT 
				COUNT(r.PAGEREQUEST_ID)    
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
				COUNT(r.PAGEREQUEST_ID)    
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