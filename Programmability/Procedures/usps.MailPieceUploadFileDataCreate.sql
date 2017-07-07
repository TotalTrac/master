SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFileDataCreate]
	@FileID		int
	, @Bytes	varbinary(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceUploadFileData]
	(
		FILEDATA_BYTES
		, FILEDATA_FILEID
	)
	OUTPUT inserted.FILEDATA_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@Bytes
		, @FileID
	);	
END
GO