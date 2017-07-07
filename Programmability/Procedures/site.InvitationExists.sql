SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[InvitationExists] 
	@UserName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT 
		INVITATION_ID 
	FROM 
		[site].[Invitations]
	WHERE 
		INVITATION_USERNAME = @UserName;

	RETURN @@ROWCOUNT ;
END
GO