SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[TemplateZipCodeDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE
		[purpleheart].[TemplateZipCodes]
	WHERE 
		ZIPCODE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE 
		RETURN 1;
END
GO