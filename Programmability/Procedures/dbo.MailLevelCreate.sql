SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailLevelCreate]
	@Description	nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailLevels]
	(
		MAILLEVEL_DESCRIPTION		
	)
	OUTPUT
		inserted.MAILLEVEL_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Description
	);
END
GO