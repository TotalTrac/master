SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[OrderZipCodeDeleteById]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[acxiom].[OrderZipCodes]
	WHERE
		ZIPCODE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO