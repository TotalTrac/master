SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplatesGetByStyle]
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
		[Style] = @Flags;
END
GO