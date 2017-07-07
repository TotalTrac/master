SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [site].[InvitationDeleteByName] 
	@UserName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		[site].[Invitations]
	WHERE
		INVITATION_USERNAME = @UserName;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;
END
GO