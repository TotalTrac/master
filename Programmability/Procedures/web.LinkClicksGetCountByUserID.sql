SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClicksGetCountByUserID]
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
			COUNT(c.LINKCLICK_ID)
		FROM
			[web].[LinkClicks] AS c
			INNER JOIN [web].[UserLinkClicks] AS u
				On c.LINKCLICK_ID = u.USERLINKCLICK_LINKCLICKID
		WHERE
			u.USERLINKCLICK_USERID = @ID;
	ELSE
		SELECT 
			COUNT(c.LINKCLICK_ID)
		FROM
			[web].[LinkClicks] AS c
			INNER JOIN [web].[UserLinkClicks] AS u
				On c.LINKCLICK_ID = u.USERLINKCLICK_LINKCLICKID
		WHERE
			u.USERLINKCLICK_USERID = @ID
			AND c.LINKCLICK_ID IN
			(
				SELECT DISTINCT USERLINKCLICK_LINKCLICKID FROM [web].[UserLinkClicks]
			);
END
GO