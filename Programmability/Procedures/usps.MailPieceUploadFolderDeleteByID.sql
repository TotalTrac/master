SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderDeleteByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE [usps].[MailPieceUploadFolders]
	WHERE
		FOLDER_ID = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1; 
END
GO