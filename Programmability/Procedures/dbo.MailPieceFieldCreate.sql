SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceFieldCreate]
	@MailPieceID	int
	, @Name			nvarchar(100)
	, @Value		sql_variant = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [dbo].[MailPieceFields]
	(
		FIELD_MAILPIECEID
		, FIELD_NAME
		, FIELD_VALUE
	)
	OUTPUT inserted.FIELD_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@MailPieceID
		, @Name
		, @Value
	);
END
GO