SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceScanCreate]
	@DateTime		datetime
    , @FacilityID	int
    , @MailPieceID	int
    , @OperationID	int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailPieceScans]
	(
		MAILPIECESCAN_DATETIME
		, MAILPIECESCAN_FACILITYID
		, MAILPIECESCAN_MAILPIECEID
		, MAILPIECESCAN_OPERATIONID
	)
	OUTPUT
		inserted.MAILPIECESCAN_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@DateTime
		, @FacilityID
		, @MailPieceID
		, @OperationID
	);
END
GO