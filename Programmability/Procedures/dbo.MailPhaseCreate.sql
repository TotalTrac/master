SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPhaseCreate]
	@Description	nvarchar(55)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailPhases]
	(
		MAILPHASE_DESCRIPTION		
	)
	OUTPUT
		inserted.MAILPHASE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Description
	);
END
GO