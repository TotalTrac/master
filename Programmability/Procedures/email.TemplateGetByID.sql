﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[TemplateGetByID]
	@ID	int
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
		Id = @ID;
	
END
GO