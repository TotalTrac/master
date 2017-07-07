SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClickDeleteByID]
	@ID int
AS
BEGIN
	
	DELETE 
		[email].[Clicks]
	WHERE
		Id = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO