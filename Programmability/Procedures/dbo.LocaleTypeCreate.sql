SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LocaleTypeCreate] 
	@Code char(3)
	, @Description nvarchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[LocaleTypes]
	(
		LOCALETYPE_CODE
		, LOCALETYPE_DESCRIPTION
	)
	OUTPUT
		inserted.LOCALETYPE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Code
		, @Description
	);
END
GO