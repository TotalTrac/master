SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberSetActiveStateByID]
	@ID					int
	, @Active			int
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [email].[Subscribers]
	SET
		[Active] = @Active
	WHERE 
		(Id = @ID);
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO