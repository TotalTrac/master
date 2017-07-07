SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[TemplateZipCodeDeleteById]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[acxiom].[TemplateZipCodes]
	WHERE
		ZIPCODE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO