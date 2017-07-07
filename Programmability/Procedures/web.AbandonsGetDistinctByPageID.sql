SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[AbandonsGetDistinctByPageID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH CTE_Visits AS (
		SELECT 
			r.UserId
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[Pages] AS p
				ON r.PageId = p.PAGE_ID AND p.PAGE_ID = @ID
	), 
	
	CTE_Clicks AS (
	SELECT 
		c.UserId
	FROM
		[web].[PageRequests] AS r
		INNER JOIN [web].[Pages] AS p
			ON r.PageId = p.PAGE_ID
		INNER JOIN [web].[Buttons] b
			ON b.BUTTON_PAGEID = p.PAGE_ID
		INNER JOIN [web].[ButtonClicks] c
			ON c.ButtonId = b.BUTTON_ID
		WHERE p.PAGE_ID = @ID)

	SELECT v.UserId
	FROM CTE_Visits v
	LEFT JOIN CTE_Clicks c
		ON v.UserId = c.UserId
	WHERE c.UserId IS NULL
	GROUP BY v.UserId
END
GO