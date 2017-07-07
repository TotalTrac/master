﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersGetInternal]	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT DISTINCT u.USER_USERID
		, u.USER_ADDRESS1
		, u.USER_ADDRESS2
		, u.USER_CITY
		, u.USER_CLIENT_ID
		, u.USER_CREATED
		, u.USER_CREATEDBY_ID
		, u.USER_DEFAULTURL		
		, u.USER_FAX
    		, USER_FIRSTNAME
		, USER_INACTIVELOGOUT
		, USER_LASTNAME
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
		INNER JOIN [dbo].[Memberships] AS m
			ON u.USER_USERID = m.MEMBERSHIP_USERID
		INNER JOIN [dbo].[Roles] AS r
			ON m.MEMBERSHIP_ROLEID = r.ROLE_ID		
    WHERE
		(r.ROLE_INTERNAL = 1) AND
		(m.MEMBERSHIP_ROLEID = ROLE_ID) AND
		(m.MEMBERSHIP_USERID = USER_USERID);   
		
END
GO