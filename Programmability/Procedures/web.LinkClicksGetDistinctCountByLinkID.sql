SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkClicksGetDistinctCountByLinkID]
	@ID	int
AS
BEGIN
	
    SET NOCOUNT ON;
    
    DECLARE @TrackAnonymous bit;
	SET @TrackAnonymous = 
	(
		SELECT 
			v.TrackAnonymousEvents
		FROM 
			--[web].[Campaigns] AS c
			--INNER JOIN [web].[Versions] AS v
				--ON c.CAMPAIGN_ID = v.VERSION_CAMPAIGNID
			[web].[Versions] AS v
			INNER JOIN [web].[Pages] AS p
				ON v.Id = p.PAGE_VERSIONID
			INNER JOIN [web].[Links] AS l
				ON p.PAGE_ID = l.LINK_PAGEID
		WHERE 
			l.LINK_ID = @ID
	);
	
	IF @TrackAnonymous = 1
		SELECT 
			COUNT(DISTINCT c.LinkId)
		FROM
			[web].[LinkClicks] AS c
			INNER JOIN [web].[Links] AS l
				ON c.LinkId = l.LINK_ID			
		WHERE
			l.LINK_ID = @ID;
	ELSE
		SELECT 
			COUNT(DISTINCT c.UserId)
		FROM
			[web].[LinkClicks] AS c
			INNER JOIN [web].[Links] AS l
				ON c.LinkId = l.LINK_ID
			--INNER JOIN [web].[UserLinkClicks] AS u
			--	ON c.LINKCLICK_ID = u.USERLINKCLICK_LINKCLICKID
		WHERE
			l.LINK_ID = @ID;			
END
GO