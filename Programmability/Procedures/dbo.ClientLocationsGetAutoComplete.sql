SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationsGetAutoComplete]
	@ID				int 
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;

    WITH CTE 
	AS
	(
		(SELECT
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
		FROM [dbo].[ClientLocations] AS loc
			INNER JOIN [dbo].[Clients] AS c
				ON loc.CLIENTID = c.CLIENT_ID
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND (r.RELATIONSHIP_USERID = @ID)

			UNION
		
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
		FROM [dbo].[ClientLocations] AS loc			
			INNER JOIN [dbo].[Users] AS u
				ON loc.CLIENTID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			loc.ID
		, loc.ADDRESS1	
		, loc.ADDRESS2
    , loc.ADDRESS3
    , loc.ADDRESS4		
    , loc.ADDRESSType	
		, loc.CITY			
		, loc.CLIENTID	
		, loc.CODE		
		, loc.CONTACT	
    , loc.COUNTRYID	
		, loc.EMAIL		
		, loc.FAX			
		, loc.NAME		
		, loc.PHONE		
    , loc.PlacesId
		, loc.POSTALCODE	
    , loc.TOLLFREE	
		, loc.REGION	
		, loc.[ROWVERSION]
		FROM [dbo].[ClientLocations] AS loc
			INNER JOIN [dbo].[Clients] AS c
				ON loc.CLIENTID = c.CLIENT_ID
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENTID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)	
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
		CTE		
	WHERE
		ADDRESS1 LIKE '%' + @Substring + '%'
		OR ADDRESS2 LIKE '%' + @Substring + '%'
    OR ADDRESS3 LIKE '%' + @Substring + '%'
    OR ADDRESS4 LIKE '%' + @Substring + '%'
		OR CITY LIKE '%' + @Substring + '%'
		OR CODE LIKE '%' + @Substring + '%'
		OR CONTACT LIKE '%' + @Substring + '%'
    OR CountryID LIKE '%' + @Substring + '%'
		OR EMAIL LIKE '%' + @Substring + '%'
		OR FAX LIKE '%' + @Substring + '%'
		OR NAME LIKE '%' + @Substring + '%'
		OR PHONE LIKE '%' + @Substring + '%'
    OR TollFree LIKE '%' + @Substring + '%'
		OR POSTALCODE LIKE '%' + @Substring + '%'
		OR REGION LIKE '%' + @Substring + '%'
END
GO