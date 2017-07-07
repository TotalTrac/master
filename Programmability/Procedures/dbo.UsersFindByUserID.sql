SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersFindByUserID]
	@ID	int
	, @DisplayName	nvarchar(50) = NULL	
	, @UserName		nvarchar(50) = NULL	
AS
BEGIN
	SET NOCOUNT ON;

	WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
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
		u.USER_USERID
		, u.USER_ADDRESS1
		, u.USER_ADDRESS2
		, u.USER_CITY
		, u.USER_CLIENT_ID
		, u.USER_CREATED
		, u.USER_CREATEDBY_ID
		, u.USER_DEFAULTURL
		, u.USER_DISPLAYNAME
		, u.USER_FAX
    , u.USER_INACTIVELOGOUT
		, u.USER_LOCKEDOUT		
		, u.USER_PHONE
		, u.USER_POSTALCODE
		, u.USER_REGION
		, u.USER_ROLES
		, u.USER_SECONDARY_EMAIL
		, u.USER_USERNAME
		, u.USER_ROWVERSION
	FROM
		[dbo].[Users] AS u
		INNER JOIN CTE
			ON u.USER_CLIENT_ID = CTE.CLIENT_ID
	WHERE
		(@DisplayName IS NULL OR @DisplayName = '' OR USER_DISPLAYNAME LIKE '%' + @DisplayName + '%')
		OR (@UserName IS NULL OR @UserName = '' OR USER_USERNAME LIKE '%' + @UserName + '%')
	ORDER BY
		u.USER_USERID;
END
GO