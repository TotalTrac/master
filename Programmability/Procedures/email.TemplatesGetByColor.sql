SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplatesGetByColor]
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
		Color & @Flags != 0;
END
GO