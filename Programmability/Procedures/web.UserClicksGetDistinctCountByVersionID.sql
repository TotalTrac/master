SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UserClicksGetDistinctCountByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
    DECLARE @Clicks TABLE
	(
		CLICK_USERID int
	)
	
	INSERT INTO @Clicks ( CLICK_USERID )	
	(SELECT
		DISTINCT lc.UserId
	FROM
		[web].[LinkClicks] AS lc			
		INNER JOIN [web].[Links] AS l
			ON lc.LinkId = l.LINK_ID	
		INNER JOIN [web].[Pages] AS p
			ON l.LINK_PAGEID = p.PAGE_ID		
	WHERE
		p.PAGE_VERSIONID = @ID)
		
	UNION ALL
	
	(SELECT
		DISTINCT lc.UserId
	FROM
		[web].[ButtonClicks] AS lc			
		INNER JOIN [web].[Buttons] AS l
			ON lc.ButtonId = l.BUTTON_ID	
		INNER JOIN [web].[Pages] AS p
			ON l.BUTTON_PAGEID = p.PAGE_ID			
	WHERE
		p.PAGE_VERSIONID = @ID);
	
	SELECT COUNT(DISTINCT CLICK_USERID) FROM @Clicks;
END
GO