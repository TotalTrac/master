SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[ButtonDeleteByID]
	@ID	int	
AS
BEGIN
	
	SET NOCOUNT ON;
	   
    DELETE
		[web].[Buttons]
	WHERE
		BUTTON_ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;		
END
GO