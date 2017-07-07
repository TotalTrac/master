SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderCreate]
	@Path	nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceUploadFolders]
	(
		FOLDER_PATH
	)
	OUTPUT inserted.FOLDER_ID AS [ID], inserted.FOLDER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Path
	);	
END
GO