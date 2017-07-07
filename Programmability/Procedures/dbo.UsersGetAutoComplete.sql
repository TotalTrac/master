﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;
DECLARE @CLIENT_ID int;
DECLARE @CLIENT_TYPE INT;
	SELECT @CLIENT_ID = USER_CLIENT_ID FROM dbo.Users WHERE USER_USERID = @Id;
  SELECT @CLIENT_TYPE = CLIENT_TYPE FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;

IF @CLIENT_TYPE = 16 OR @CLIENT_TYPE IS NULL
  BEGIN
	DECLARE @ParentID int;
	SELECT 
		@ParentID = CLIENT_PARENTID 
	FROM 
		dbo.Users AS u
		INNER JOIN dbo.Clients AS c
			ON u.USER_CLIENT_ID = c.CLIENT_ID
	WHERE
		u.USER_USERID = @ID;

	-- GET ALL OF THE INTERNAL USERS THAT MATCH
	-- REGARDLESS OF RELATIONSHIPS
  (
		SELECT 
			USER_USERID
			, USER_ADDRESS1
			, USER_ADDRESS2
			, USER_CITY
			, USER_CLIENT_ID
			, USER_CREATED
			, USER_CREATEDBY_ID
			, USER_DEFAULTURL		
			, USER_FAX
    	, USER_FIRSTNAME
			, USER_INACTIVELOGOUT
			, USER_LASTNAME
			, USER_LOCKEDOUT		
			, USER_PHONE
			, USER_POSTALCODE
			, USER_REGION
			, USER_ROLES
			, USER_SECONDARY_EMAIL
			, USER_USERNAME
			, USER_ROWVERSION
		FROM 
			[dbo].[Users] As u
			INNER JOIN [dbo].[Clients] AS c
				ON (u.[USER_CLIENT_ID] = c.CLIENT_ID)
					AND (c.CLIENT_INTERNAL = 1)
		WHERE
			(u.USER_FIRSTNAME LIKE '%' + @Substring + '%'
			OR u.USER_LASTNAME LIKE '%' + @Substring + '%'
			OR u.USER_USERNAME LIKE '%' + @Substring + '%') AND u.USER_LOCKEDOUT != 1
	)

	UNION 

	-- GET ALL OF THE EXTERNAL USERS THAT MATCH
	-- BASED ON RELATIONSHIPS
	(
		SELECT 
			USER_USERID
			, USER_ADDRESS1
			, USER_ADDRESS2
			, USER_CITY
			, USER_CLIENT_ID
			, USER_CREATED
			, USER_CREATEDBY_ID
			, USER_DEFAULTURL		
			, USER_FAX
    		, USER_FIRSTNAME
			, USER_INACTIVELOGOUT
			, USER_LASTNAME
			, USER_LOCKEDOUT		
			, USER_PHONE
			, USER_POSTALCODE
			, USER_REGION
			, USER_ROLES
			, USER_SECONDARY_EMAIL
			, USER_USERNAME
			, USER_ROWVERSION
		FROM 
			[dbo].[Users] As u
			INNER JOIN [dbo].[Clients] AS c
				ON (u.USER_CLIENT_ID = c.CLIENT_ID)
			INNER JOIN [dbo].[ClientRelationships] AS r
				ON r.ParentClientId = @ParentID
					AND c.CLIENT_ID = r.PartnerClientId
		WHERE
			(u.USER_FIRSTNAME LIKE '%' + @Substring + '%'
			OR u.USER_LASTNAME LIKE '%' + @Substring + '%'
			OR u.USER_USERNAME LIKE '%' + @Substring + '%') AND u.USER_LOCKEDOUT != 1
	)
    END
ELSE
  BEGIN

(
		SELECT 
			USER_USERID
			, USER_ADDRESS1
			, USER_ADDRESS2
			, USER_CITY
			, USER_CLIENT_ID
			, USER_CREATED
			, USER_CREATEDBY_ID
			, USER_DEFAULTURL		
			, USER_FAX
    	, USER_FIRSTNAME
			, USER_INACTIVELOGOUT
			, USER_LASTNAME
			, USER_LOCKEDOUT		
			, USER_PHONE
			, USER_POSTALCODE
			, USER_REGION
			, USER_ROLES
			, USER_SECONDARY_EMAIL
			, USER_USERNAME
			, USER_ROWVERSION
		FROM 
			[dbo].[Users] As u
			INNER JOIN [dbo].[Clients] AS c
				ON (u.[USER_CLIENT_ID] = c.CLIENT_ID)
					AND (c.CLIENT_INTERNAL = 1)
		WHERE
			(u.USER_FIRSTNAME LIKE '%' + @Substring + '%'
			OR u.USER_LASTNAME LIKE '%' + @Substring + '%'
			OR u.USER_USERNAME LIKE '%' + @Substring + '%') AND u.USER_LOCKEDOUT != 1
	)

	UNION 

	-- GET ALL OF THE EXTERNAL USERS THAT MATCH
	-- BASED ON RELATIONSHIPS
	(
		SELECT DISTINCT cRu.USER_USERID
			, cRu.USER_ADDRESS1
			, cRu.USER_ADDRESS2
			, cRu.USER_CITY
			, cRu.USER_CLIENT_ID
			, cRu.USER_CREATED
			, cRu.USER_CREATEDBY_ID
			, cRu.USER_DEFAULTURL		
			, cRu.USER_FAX
    	, cRu.USER_FIRSTNAME
			, cRu.USER_INACTIVELOGOUT
			, cRu.USER_LASTNAME
			, cRu.USER_LOCKEDOUT		
			, cRu.USER_PHONE
			, cRu.USER_POSTALCODE
			, cRu.USER_REGION
			, cRu.USER_ROLES
			, cRu.USER_SECONDARY_EMAIL
			, cRu.USER_USERNAME
			, cRu.USER_ROWVERSION FROM dbo.Users u
  INNER JOIN dbo.Clients c ON c.CLIENT_ID = u.USER_CLIENT_ID
  INNER JOIN dbo.ClientRelationships cr ON cr.ParentClientId = c.CLIENT_ID 
  INNER JOIN dbo.ClientRelationships cr1 ON cr1.PartnerClientId = c.CLIENT_ID
  INNER JOIN dbo.Clients cRc ON cRc.CLIENT_ID = cr.PartnerClientId OR cr1.ParentClientId = cRc.CLIENT_ID
  INNER JOIN dbo.Users cRu ON cRu.USER_CLIENT_ID = cRc.CLIENT_ID OR cRu.USER_CLIENT_ID = @CLIENT_ID
  WHERE u.USER_CLIENT_ID = @CLIENT_ID AND cRu.USER_LOCKEDOUT != 1 AND cRu.USER_USERID != @Id
			AND (cRu.USER_FIRSTNAME LIKE '%' + @Substring + '%'
			OR cRu.USER_LASTNAME LIKE '%' + @Substring + '%'
			OR cRu.USER_USERNAME LIKE '%' + @Substring + '%') 
	)

  END

END
GO