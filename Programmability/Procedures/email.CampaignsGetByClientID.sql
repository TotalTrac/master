SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetByClientID]
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
		e.Id
		, e.CampaignId
		, e.ClientId
		, e.Created
		, e.Name
		, e.[RowVersion]
	FROM 
		[email].[Campaigns] AS e
		INNER JOIN CTE AS c
			ON e.ClientId = c.CLIENT_ID
	ORDER BY
		Id;
END
GO