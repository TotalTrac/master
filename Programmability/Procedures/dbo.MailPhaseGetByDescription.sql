SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPhaseGetByDescription] 
	@Description nvarchar(55)
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		MAILPHASE_ID
		, MAILPHASE_DESCRIPTION
	FROM 
		[dbo].[MailPhases]
	WHERE
		MAILPHASE_DESCRIPTION = @Description
END
GO