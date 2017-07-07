SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemTypeGetByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ID
		, NAME
		, ATTRIBUTES
		, [ROWVERSION] 
	FROM 
		job.[AffixingItemTypes]
	WHERE 
		ID = @ID;
END
GO