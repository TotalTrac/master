SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [mail].[EventListenersGetByClientID]
	@ID			int
	, @Events	int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	-- Create a CTE to traverse *UP* the client hierarchy
	WITH CTE 
	(
		CTE_ID
		, CTE_PARENTID
	)
	AS
	(		
		SELECT 
			c.CLIENT_ID
			, c.CLIENT_PARENTID
		FROM 
			[dbo].[Clients] AS c			
		WHERE 
			c.CLIENT_ID = @ID
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
			, c.CLIENT_PARENTID
		FROM 
			[dbo].[Clients] AS c
			INNER JOIN CTE
				ON CTE.CTE_PARENTID = c.CLIENT_ID
	)
	SELECT 
		DISTINCT l.EVENTLISTENER_ID
		, l.EVENTLISTENER_EVENTS
		, l.EVENTLISTENER_USERID
		, l.EVENTLISTENER_ROWVERSION
	FROM 
		[mail].[EventListeners] AS l
		INNER JOIN [dbo].[Relationships] AS r
			ON l.EVENTLISTENER_USERID = r.RELATIONSHIP_USERID
		INNER JOIN CTE AS c
			ON r.RELATIONSHIP_CLIENTID = c.CTE_ID
	WHERE
		@Events & l.EVENTLISTENER_EVENTS > 0
	ORDER BY
		l.EVENTLISTENER_ID;
END
GO