SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateZipCodeDeleteById]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[StVincent].[TemplateZipCodes]
	WHERE
		ZIPCODE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO