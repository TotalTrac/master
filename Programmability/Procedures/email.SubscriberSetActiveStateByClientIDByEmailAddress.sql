SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberSetActiveStateByClientIDByEmailAddress]
	@ID					int
	, @EmailAddress		nvarchar(320)
	, @Active			int
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [email].[Subscribers]
	SET
		[Active] = @Active
	WHERE 
		(ClientId = @ID)
		AND (EmailAddress = @EmailAddress)
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO