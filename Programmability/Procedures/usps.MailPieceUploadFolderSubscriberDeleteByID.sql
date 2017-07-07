SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFolderSubscriberDeleteByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE [usps].[MailPieceUploadFolderSubscribers]
	WHERE
		SUBSCRIBER_ID = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1; 
END
GO