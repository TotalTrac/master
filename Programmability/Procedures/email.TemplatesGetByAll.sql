SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplatesGetByAll]
	 @Flags1	int
	,@Flags2	int
	,@Flags3	int
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
		Color & @Flags1 != 0 and Category & @Flags2 != 0 and [Style] & @Flags3 != 0;
END
GO