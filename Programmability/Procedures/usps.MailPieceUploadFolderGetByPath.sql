SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderGetByPath]
	@Path	nvarchar(MAX)		
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		FOLDER_ID
		, FOLDER_PATH
		, FOLDER_ROWVERSION
	FROM
		[usps].[MailPieceUploadFolders]
	WHERE
		FOLDER_PATH = @Path;
END
GO