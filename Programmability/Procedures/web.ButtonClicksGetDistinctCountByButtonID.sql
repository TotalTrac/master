SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonClicksGetDistinctCountByButtonID]
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
			[web].[Versions] AS v			
			INNER JOIN [web].[Pages] AS p
				ON v.Id = p.PAGE_VERSIONID
			INNER JOIN [web].[Buttons] AS b
				ON p.PAGE_ID = b.BUTTON_PAGEID
		WHERE 
			b.BUTTON_ID = @ID
	);
	
	IF @TrackAnonymous = 1
		SELECT 
			COUNT(DISTINCT c.ButtonId)
		FROM
			[web].[ButtonClicks] AS c
			INNER JOIN [web].[Buttons] AS b
				ON c.ButtonId = b.BUTTON_ID			
		WHERE
			b.BUTTON_ID = @ID;
	ELSE
		SELECT 
			COUNT(DISTINCT c.UserId)
		FROM
			[web].[ButtonClicks] AS c
			INNER JOIN [web].[Buttons] AS b
				ON c.ButtonId = b.BUTTON_ID			
		WHERE
			b.BUTTON_ID = @ID;			
END
GO