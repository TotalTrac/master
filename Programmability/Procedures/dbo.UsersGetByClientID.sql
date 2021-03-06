﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersGetByClientID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

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
		[dbo].[Users]
	WHERE 
		USER_CLIENT_ID = @ID;
END
GO