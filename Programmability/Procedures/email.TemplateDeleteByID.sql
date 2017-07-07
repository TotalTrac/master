SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[TemplateDeleteByID]
	@ID	int
AS
BEGIN
	DELETE 
		[email].Templates
	WHERE 
		Id = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO