SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectsGetByClientIDs]
	@IDs varchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
    
    SELECT
		p.PROJECT_ID
		, p.PROJECT_CLIENTID
		, p.PROJECT_PARENTID
		, p.PROJECT_NAME
		, p.PROJECT_ROWVERSION 
	FROM 
		[dbo].[Projects] AS p
	WHERE 
		p.PROJECT_ID IN (
			SELECT
				PROJECT_ID
			FROM 
				[dbo].[Projects] AS p
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON p.PROJECT_CLIENTID = i.number
			)
	ORDER BY
		p.PROJECT_ID;
END
GO