SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailingFileCreate]
	@FileID			int
	, @MailingID	int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT [usps].[MailingFiles]
	(
		FILE_MAILINGID
		, FILE_METADATAID
	)
	OUTPUT inserted.FILE_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@MailingID
		, @FileID
	);	
END
GO