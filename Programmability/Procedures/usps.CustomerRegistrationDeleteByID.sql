SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationDeleteByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE
		[usps].[CustomerRegistrations]
	WHERE
		CRID_ID = @ID;

	IF @@ROWCOUNT = 0
		RETURN 1;
	ELSE
		RETURN 0;	
END
GO