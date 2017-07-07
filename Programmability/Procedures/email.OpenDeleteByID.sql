SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[OpenDeleteByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE 
		[email].[Opens] 
	WHERE
		Id = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO