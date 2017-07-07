SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailLevelGetByDescription] 
	@Description nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		MAILLEVEL_ID
		, MAILLEVEL_DESCRIPTION
	FROM 
		[dbo].[MailLevels]
	WHERE
		MAILLEVEL_DESCRIPTION = @Description
END
GO