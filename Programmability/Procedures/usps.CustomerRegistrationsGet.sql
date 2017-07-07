SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[CustomerRegistrationsGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		CRID_ID    
		, CRID_CLIENTID
		, CRID_NAME
		, CRID_NONPROFITAUTH		
	FROM
		[usps].[CustomerRegistrations];	
	
END
GO