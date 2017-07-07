SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationsGetByClientID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID
		, ADDRESS1	
		, ADDRESS2
    , ADDRESS3
    , ADDRESS4		
    , ADDRESSType	
		, CITY			
		, CLIENTID	
		, CODE		
		, CONTACT	
    , COUNTRYId	
		, EMAIL		
		, FAX			
		, NAME		
		, PHONE	
    , PlacesId	
		, POSTALCODE	
    , TOLLFREE	
		, REGION	
		, [ROWVERSION]
	FROM
		[dbo].[ClientLocations]
	WHERE
		CLIENTID = @ID
	
END
GO