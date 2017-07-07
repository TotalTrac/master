SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[InvitationDeleteByKey] 
	@Key nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE 
		[site].[Invitations]
	WHERE
		INVITATION_KEY = @Key;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;
END
GO