SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailerDeleteByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE
		[usps].[Mailers]
	WHERE
		[Id] = @ID;

	IF @@ROWCOUNT = 0
		RETURN 1;
	ELSE
		RETURN 0;	
END
GO