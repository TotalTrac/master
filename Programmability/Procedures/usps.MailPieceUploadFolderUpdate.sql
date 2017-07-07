SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderUpdate]
	@ID			int
	, @Path		nvarchar(MAX)
	, @Version	timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [usps].[MailPieceUploadFolders]
	SET
		FOLDER_PATH =  @Path	
	OUTPUT inserted.FOLDER_ID AS [ID], inserted.FOLDER_ROWVERSION AS [VERSION]
	WHERE
		FOLDER_ID = @ID
		AND FOLDER_ROWVERSION = @Version;
END
GO