SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[PasswordResetRequestDeleteByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE
		[site].[PasswordResetRequests]	
	WHERE
		REQUEST_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO