SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageTypeCreate] 
	@Name			nvarchar(50)
	, @Attributes	int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	INSERT [dbo].[PostageTypes]
	(
		POSTAGETYPE_NAME
		, POSTAGETYPE_ATTRIBUTES
	) 
	OUTPUT		
		inserted.POSTAGETYPE_ID AS ID, NULL AS [VERSION]
	VALUES 
	(
		@Name
		, @Attributes
	);
END
GO