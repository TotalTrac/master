SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationGetByID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		CRID_ID    
		, CRID_CLIENTID
		, CRID_NAME
		, CRID_NONPROFITAUTH
	FROM
		[usps].[CustomerRegistrations]
	WHERE
		CRID_ID = @ID;
	
END
GO