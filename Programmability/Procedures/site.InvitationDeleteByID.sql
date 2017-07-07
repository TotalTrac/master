SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [site].[InvitationDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DELETE 
		[site].[Invitations]
	WHERE 
		INVITATION_ID = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;

END
GO