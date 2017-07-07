SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFileUpdate]
	@ID					int
	, @FolderID			int
	, @Key				uniqueidentifier
	, @LastModified		datetime
	, @Name				nvarchar(max)
	, @ProcessingBegun	datetime = NULL
	, @ProcessingEnded	datetime = NULL
	, @RecordCount		int = NULL
	, @Size				int
	, @Version			timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [usps].[MailPieceUploadFiles]
	SET
		FILE_FOLDERID			= @FolderID
		, FILE_KEY				= @Key
		, FILE_LASTMODIFIED		= @LastModified
		, [FILE_NAME]			= @Name
		, FILE_PROCESSINGBEGUN	= @ProcessingBegun
		, FILE_PROCESSINGENDED	= @ProcessingEnded
		, FILE_RECORDCOUNT		= @RecordCount
		, FILE_SIZE				= @Size	
	OUTPUT inserted.FILE_ID AS [ID], inserted.FILE_ROWVERSION AS [VERSION]
	WHERE
		[FILE_ID] = @ID
		AND FILE_ROWVERSION = @Version;
END
GO