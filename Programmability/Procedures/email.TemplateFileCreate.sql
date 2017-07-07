SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplateFileCreate]
	@Name				nvarchar(200)
	,@Size				bigint
	,@Data				varbinary(MAX)

	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[TemplateFiles]
	(
		
		Name
		,[Size]
		,[Data] 

	)
	OUTPUT
		inserted.Id AS ID, inserted.[Rowversion] AS [VERSION]
	VALUES
	(
		@Name
		,@Size
		,@Data
		)
END
GO