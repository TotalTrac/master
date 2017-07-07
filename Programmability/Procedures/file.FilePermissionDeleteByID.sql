SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [file].[FilePermissionDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		[file].[FilePermissions]
	WHERE 
		FILEPERMISSION_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO