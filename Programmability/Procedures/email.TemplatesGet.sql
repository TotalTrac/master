SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[TemplatesGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, Markup
		, Name
		, Color
		, [Style]
		, Category
	FROM 
		[email].Templates
	
	
END
GO