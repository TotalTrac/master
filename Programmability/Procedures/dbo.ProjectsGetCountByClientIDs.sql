SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsGetCountByClientIDs]
	@IDs varchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
    
    SELECT
		COUNT(p.PROJECT_ID)		
	FROM [dbo].[Projects] AS p
	WHERE 
		p.PROJECT_ID IN (
			SELECT
				PROJECT_ID
			FROM 
				[dbo].[Projects] AS p
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON p.PROJECT_CLIENTID = i.number
			);
END
GO