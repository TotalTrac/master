SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationsGetAllAutoComplete]	
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
		  [CRID_ID]
		, c.CLIENT_NAME
		, cr.CRID_NAME
		, cr.CRID_NONPROFITAUTH
		, c.CLIENT_SHORTNAME
 
	  FROM [usps].[CustomerRegistrations] cr
	  INNER JOIN dbo.Clients c on c.CLIENT_ID = cr.CRID_CLIENTID
	  INNER JOIN CTE ON CTE.CLIENT_ID = cr.CRID_CLIENTID
	WHERE
		   CRID_ID LIKE '%' + @Substring + '%'
		OR c.CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
		OR c.CLIENT_NAME LIKE '%' + @Substring + '%'
    OR cr.CRID_NAME LIKE '%' + @Substring + '%'
END
GO