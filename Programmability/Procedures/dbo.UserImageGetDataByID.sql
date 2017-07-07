SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserImageGetDataByID]
	@ID int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT		
		ui.data
	FROM 
		dbo.UserImages ui
	WHERE 
		ui.Id = @ID;			
END
GO