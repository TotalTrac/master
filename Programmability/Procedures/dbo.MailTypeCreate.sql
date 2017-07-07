SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailTypeCreate]
	@Description	nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailTypes]
	(
		MAILTYPE_DESCRIPTION		
	)
	OUTPUT
		inserted.MAILTYPE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Description
	);
END
GO