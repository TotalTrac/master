SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceFieldsMerge]
	@ThreadID int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [dbo].[MailPieceFields]
	(
		FIELD_MAILPIECEID
		, FIELD_NAME
		, FIELD_VALUE
	)
	SELECT
		(SELECT TOP 1
				m.MAILPIECE_ID		
			FROM
				[dbo].[MailPieces] AS m		
			WHERE
				(m.MAILPIECE_TRACKINGCODE = FIELD_TRACKINGCODE)
				AND (m.MAILPIECE_ROUTINGCODE = FIELD_ROUTINGCODE)
			ORDER BY
				m.MAILPIECE_ID DESC)
		, FIELD_NAME
		, FIELD_VALUE
	FROM 
		[dbo].[MailPieceFieldsStaging]
	WHERE
		FIELD_THREADID = @ThreadID;

	DELETE 
		[dbo].[MailPieceFieldsStaging]
	WHERE
		FIELD_THREADID = @ThreadID;
	
END
GO