SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderSubscriberCreate]
	@EmailAddress	nvarchar(320)
	, @EmailTypeID	int
	, @Events		int = NULL
	, @FolderID		int
	, @Name			nvarchar(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceUploadFolderSubscribers]
	(
		SUBSCRIBER_EMAILADDRESS
		, SUBSCRIBER_EMAILTYPEID
		, SUBSCRIBER_EVENTS
		, SUBSCRIBER_FOLDERID
		, SUBSCRIBER_NAME
	)
	OUTPUT inserted.SUBSCRIBER_ID AS [ID], inserted.SUBSCRIBER_ROWVERSION AS [VERSION]
	VALUES
	(
		@EmailAddress
		, @EmailTypeID
		, @Events
		, @FolderID
		, @Name
	);
END
GO