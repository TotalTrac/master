﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFileDataGetByFileID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		FILEDATA_ID
		, FILEDATA_BYTES
		, FILEDATA_FILEID
	FROM
		[usps].[MailPieceUploadFileData]
	WHERE
		FILEDATA_FILEID = @ID;
	
END
GO