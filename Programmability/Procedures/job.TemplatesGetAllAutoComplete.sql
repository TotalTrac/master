SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[TemplatesGetAllAutoComplete]	
	  @Substring	nvarchar(255)
	, @Id			int
AS
BEGIN
			
	SET NOCOUNT ON;

	 WITH CTE (CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME)
	AS
	(
		(SELECT c.CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)

		SELECT
		  Id
   	, t.[ClientID]
    , t.TemplateTypeId
		, c.CLIENT_NAME AS ClientName
    , t.Name
		, c.CLIENT_SHORTNAME AS ClientShortName
 
	  FROM job.Templates t
	  INNER JOIN dbo.Clients c on c.CLIENT_ID = t.ClientId
	  INNER JOIN CTE ON CTE.CLIENT_ID = t.ClientId
	WHERE
		   
		c.CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
		OR c.CLIENT_NAME LIKE '%' + @Substring + '%'
    OR t.Name LIKE '%' + @Substring + '%'
END
GO