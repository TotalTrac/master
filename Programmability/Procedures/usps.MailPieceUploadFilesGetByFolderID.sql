﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFilesGetByFolderID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		[FILE_ID]
		, FILE_FOLDERID
		, FILE_KEY
		, FILE_LASTMODIFIED
		, [FILE_NAME]
		, FILE_PROCESSINGBEGUN
		, FILE_PROCESSINGENDED
		, FILE_RECORDCOUNT
		, FILE_SIZE
		, FILE_ROWVERSION		
	FROM
		[usps].[MailPieceUploadFiles]
	WHERE
		FILE_FOLDERID = @ID
	
END
GO