SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplateFileGetByID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, [Data]
		,Name
		,[Size]
		,[Rowversion]
	FROM 
		[email].TemplateFiles
	WHERE 
		Id = @ID;
	
END
GO