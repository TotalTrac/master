SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[TemplateUpdate]
	
      @ID						int	
	, @MarkupText				nvarchar(MAX)
	, @Version					timestamp
	, @Name						nvarchar(200)
	, @Style					int
	, @Color					int
	, @Category					int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].TEMPLATES
	SET	
			Markup = @MarkupText
			,Name = @Name
			,Color = @Color
			,Category  = @Category
			,[Style] = @Style

	
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		(Id = @ID) AND 
		([RowVersion] = @Version);	
END
GO