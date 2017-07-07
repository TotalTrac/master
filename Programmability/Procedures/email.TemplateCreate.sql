SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[TemplateCreate]
	@MarkupText				nvarchar(MAX)
	,@Name					nvarchar(200)
	, @Style					int
	, @Color					int
	, @Category					int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Templates]
	(
		Markup
		,Name
		,Color 
		,Category  
		,[Style] 
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@MarkupText
		,@Name
		,@Style
		,@Color
		,@Category
		)
END
GO