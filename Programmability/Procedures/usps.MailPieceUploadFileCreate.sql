SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFileCreate]
	@FolderID			int
	, @Key				uniqueidentifier
	, @LastModified		datetime
	, @Name				nvarchar(max)
	, @ProcessingBegun	datetime = NULL
	, @ProcessingEnded	datetime = NULL
	, @RecordCount		int = NULL
	, @Size				int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceUploadFiles]
	(
		FILE_FOLDERID
		, FILE_KEY
		, FILE_LASTMODIFIED
		, [FILE_NAME]
		, FILE_PROCESSINGBEGUN
		, FILE_PROCESSINGENDED
		, FILE_RECORDCOUNT
		, FILE_SIZE
	)
	OUTPUT inserted.FILE_ID AS [ID], inserted.FILE_ROWVERSION AS [VERSION]
	VALUES
	(
		@FolderID
		, @Key
		, @LastModified
		, @Name
		, @ProcessingBegun
		, @ProcessingEnded
		, @RecordCount
		, @Size
	);
END
GO