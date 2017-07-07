﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[InvitationsGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		INVITATION_ID
		, INVITATION_CLIENTID
		, INVITATION_CREATED
		, INVITATION_CREATEDBYID
		, INVITATION_DEFAULTURL
		, INVITATION_HOST
		, INVITATION_KEY
		, INVITATION_ROLEID
		, INVITATION_SITEID		
		, INVITATION_USERNAME
	FROM 
		[site].[Invitations];
END
GO