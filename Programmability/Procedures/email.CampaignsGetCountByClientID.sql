SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetCountByClientID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(		
		SELECT 
			c.CLIENT_ID
		FROM 
			[dbo].[Clients] AS c			
		WHERE 
			c.CLIENT_ID = @ID
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM 
			[dbo].[Clients] AS c
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL			
	)
	SELECT 
		COUNT(e.Id)
	FROM 
		[email].[Campaigns] AS e
		INNER JOIN CTE AS c
			ON e.ClientId = c.CLIENT_ID;
END
GO