SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationsGetAllAutoComplete]	
	@Substring	nvarchar(255)
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
		ADDRESS1 LIKE '%' + @Substring + '%'
		OR ADDRESS2 LIKE '%' + @Substring + '%'
    OR ADDRESS3 LIKE '%' + @Substring + '%'
    OR ADDRESS4 LIKE '%' + @Substring + '%'
		OR CITY LIKE '%' + @Substring + '%'
		OR CODE LIKE '%' + @Substring + '%'
		OR CONTACT LIKE '%' + @Substring + '%'
    OR CountryId LIKE '%' + @Substring + '%'
		OR EMAIL LIKE '%' + @Substring + '%'
		OR FAX LIKE '%' + @Substring + '%'
		OR NAME LIKE '%' + @Substring + '%'
		OR PHONE LIKE '%' + @Substring + '%'
    OR TollFree LIKE '%' + @Substring + '%'
		OR POSTALCODE LIKE '%' + @Substring + '%'
		OR REGION LIKE '%' + @Substring + '%'
END
GO