SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemTypeCreate] 
	@Name			nvarchar(20)
	, @Attributes	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT job.[AffixingItemTypes]
	(
		NAME
		, ATTRIBUTES
	) 
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	VALUES 
	(
		@Name
		, @Attributes
	);
END
GO