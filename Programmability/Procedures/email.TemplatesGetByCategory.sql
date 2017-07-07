SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplatesGetByCategory]
	@Flags	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, Markup
		, Name
		, [Style]
		, Color
		, Category
	FROM 
		[email].Templates
	
	WHERE 
		Category & @Flags != 0;
END
GO