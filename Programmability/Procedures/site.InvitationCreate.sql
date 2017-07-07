SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[InvitationCreate] 
	@UserName		nvarchar(50)
	, @Key			nvarchar(50)
	, @CreatedByID	int	
	, @DefaultUrl	nvarchar(200) = NULL
	, @Host			nvarchar(4000)
	, @RoleID		int
	, @SiteID		int
	, @ClientID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT INVITATION_ID FROM [site].[Invitations] WHERE INVITATION_USERNAME = @UserName)
		RETURN -1;
	
	INSERT INTO [site].[Invitations]
	(
		INVITATION_USERNAME
		, INVITATION_KEY
		, INVITATION_DEFAULTURL
		, INVITATION_CREATEDBYID
		, INVITATION_CREATED
		, INVITATION_HOST
		, INVITATION_ROLEID
		, INVITATION_SITEID
		, INVITATION_CLIENTID
	)
	OUTPUT
		inserted.INVITATION_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@UserName
		, @Key
		, @DefaultUrl
		, @CreatedByID
		--, @Created
		, GETUTCDATE()
		, @Host
		, @RoleID
		, @SiteID
		, @ClientID
	);
END
GO