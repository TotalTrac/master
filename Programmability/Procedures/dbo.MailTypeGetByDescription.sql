SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailTypeGetByDescription] 
	@Description nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		MAILTYPE_ID
		, MAILTYPE_DESCRIPTION
	FROM 
		[dbo].[MailTypes]
	WHERE
		MAILTYPE_DESCRIPTION = @Description
END
GO