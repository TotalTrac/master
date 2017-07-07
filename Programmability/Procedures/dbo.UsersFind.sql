SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersFind]	
	@ClientIDs			varchar(100) = NULL
	, @DisplayName		nvarchar(50) = NULL	
	, @UserName			nvarchar(50) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		USER_USERID
		, USER_CLIENT_ID
		, USER_CREATED
		, USER_CREATEDBY_ID	
		, USER_DEFAULTURL	
		, USER_DISPLAYNAME
		, USER_FAX
    , USER_INACTIVELOGOUT				
		, USER_LOCKEDOUT		
		, USER_PASSWORD
		, USER_REGION
		, USER_ROLES
		, USER_SECONDARY_EMAIL
		, USER_USERNAME			
		, USER_ROWVERSION
	FROM 
		[dbo].[Users]
	WHERE
		(@ClientIDs IS NULL OR @ClientIDs = '' OR USER_USERID IN (
		SELECT
			USER_USERID
		FROM 
			[dbo].[Users] AS u
			INNER JOIN IntegerListToTable(@ClientIDs) AS i 
				ON u.USER_CLIENT_ID = i.number
		))	
	AND		
		 (@DisplayName IS NULL OR @DisplayName = '' OR USER_DISPLAYNAME LIKE '%' + @DisplayName + '%')		 
		 AND (@UserName IS NULL OR @UserName = '' OR USER_USERNAME LIKE '%' + @UserName + '%')
	ORDER BY
		USER_USERID;		
END
GO