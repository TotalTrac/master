SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[LocaleCreate] 
	@Key		char(6)
	, @TypeId	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[Locales]
	(
		LOCALE_KEY
		, LOCALE_TYPEID
	)
	OUTPUT
		inserted.LOCALE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Key
		, @TypeId
	);
END
GO