﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderSubscribersGetByFolderID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		SUBSCRIBER_ID
		, SUBSCRIBER_EMAILADDRESS
		, SUBSCRIBER_EMAILTYPEID
		, SUBSCRIBER_EVENTS
		, SUBSCRIBER_FOLDERID
		, SUBSCRIBER_NAME
		, SUBSCRIBER_ROWVERSION
	FROM
		[usps].[MailPieceUploadFolderSubscribers]
	WHERE
		SUBSCRIBER_FOLDERID = @ID
END
GO