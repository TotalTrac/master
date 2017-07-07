﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClicksGetCountByUserID]
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
			COUNT(c.BUTTONCLICK_ID)		
		FROM
			[web].[ButtonClicks] AS c
			INNER JOIN [web].[UserButtonClicks] AS u
				ON c.BUTTONCLICK_ID = u.USERBUTTONCLICK_BUTTONCLICKID
		WHERE
			u.USERBUTTONCLICK_USERID = u.USERBUTTONCLICK_USERID;
	ELSE
			SELECT 
			COUNT(c.BUTTONCLICK_ID)		
		FROM
			[web].[ButtonClicks] AS c
			INNER JOIN [web].[UserButtonClicks] AS u
				ON c.BUTTONCLICK_ID = u.USERBUTTONCLICK_BUTTONCLICKID
		WHERE
			u.USERBUTTONCLICK_USERID = u.USERBUTTONCLICK_USERID
			AND c.BUTTONCLICK_ID IN
			(
				SELECT DISTINCT USERBUTTONCLICK_BUTTONCLICKID FROM [web].[UserButtonClicks]
			);	
END
GO