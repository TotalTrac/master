SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemTypeDeleteByName]
	@LabelTypeName int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		job.[AffixingItemTypes]
	WHERE
		NAME = @LabelTypeName;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;   
	
END
GO