SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadLogItemsGetByFileID]
	@ID				int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql nvarchar(max);
		
	SELECT
		LOG_ID
		, LOG_DATETIME
		, LOG_FILEID						
		, LOG_MESSAGE
		, LOG_MESSAGETYPEID
		, LOG_RECORDNUMBER		
	FROM
		[usps].[MailPieceUploadLogItems]		
	WHERE
		LOG_FILEID = @ID;	
END
GO