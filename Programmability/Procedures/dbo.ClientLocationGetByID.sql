SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationGetByID]
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
    , COUNTRYID	
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
		ID = @ID
	
END
GO