SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationsGetByClientID]
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		crid.CRID_ID
		, crid.CRID_NAME
		, crid.CRID_CLIENTID		
		, crid.CRID_NONPROFITAUTH		
	FROM
		[usps].[CustomerRegistrations] AS crid
	WHERE
		crid.CRID_CLIENTID = @ID;	
END
GO