SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendDeleteByID]
	@ID int
AS
BEGIN
	DELETE 
		[email].[Sends]
	WHERE
		Id = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO