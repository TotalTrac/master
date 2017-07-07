SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadLogItemCreate]
	@DateTime			datetime	
	, @FileID			int	
	, @Message			nvarchar(max)
	, @MessageTypeID	int	
	, @RecordNumber		int	= null	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceUploadLogItems]
	(
		LOG_DATETIME	
		, LOG_FILEID			
		, LOG_MESSAGE
		, LOG_MESSAGETYPEID
		, LOG_RECORDNUMBER
	)
	OUTPUT inserted.LOG_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@DateTime		
		, @FileID		
		, @Message
		, @MessageTypeID
		, @RecordNumber
	);
	
END
GO