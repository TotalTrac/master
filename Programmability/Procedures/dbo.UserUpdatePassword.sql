SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[UserUpdatePassword] 
	@ID			int
	, @Password	varbinary(MAX)
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Users] 
	SET
		USER_PASSWORD = @Password
	WHERE
		USER_USERID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1
END
GO