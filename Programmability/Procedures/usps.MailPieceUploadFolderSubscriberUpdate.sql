SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderSubscriberUpdate]
	@ID				int
	, @EmailAddress	nvarchar(320)
	, @EmailTypeID	int
	, @Events		int = NULL
	, @FolderID		int
	, @Name			nvarchar(100) = NULL
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [usps].[MailPieceUploadFolderSubscribers]
	SET
		SUBSCRIBER_EMAILADDRESS		= @EmailAddress
		, SUBSCRIBER_EMAILTYPEID	= @EmailTypeID
		, SUBSCRIBER_EVENTS			= @Events
		, SUBSCRIBER_FOLDERID		= @FolderID
		, SUBSCRIBER_NAME			= @Name	
	OUTPUT inserted.SUBSCRIBER_ID AS [ID], inserted.SUBSCRIBER_ROWVERSION AS [VERSION]
	WHERE
		SUBSCRIBER_ID = @ID
		AND SUBSCRIBER_ROWVERSION = @Version
END
GO