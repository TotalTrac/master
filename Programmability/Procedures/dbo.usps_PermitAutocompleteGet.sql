SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usps_PermitAutocompleteGet]
	@ID				int
	, @Substring	nvarchar(255)
	, @MaxItems		int = 100
AS
BEGIN
			
	SET NOCOUNT ON;
	    
	SELECT DISTINCT
		c.CLIENT_NAME				AS [ClientName]
		, c.CLIENT_SHORTNAME		AS [ClientShortName]
		, PERMIT_ID					AS [Id]
		--, PERMIT_ACCOUNTNUMBER
		--, PERMIT_ADDRESS1
		--, PERMIT_ADDRESS2
		--, PERMIT_CITY
		--, PERMIT_CLIENTID
		--, PERMIT_COMPANY
		--, PERMIT_CREATED
		--, PERMIT_CREATEDBYID
		--, PERMIT_EXPIRATIONDATE
		--, PERMIT_GLOBAL
		, PERMIT_NUMBER				AS [Number]
		--, PERMIT_POSTOFFICE
		--, PERMIT_STATE
		--, PERMIT_TYPEID
		, t.PERMITTYPE_NAME			AS [PermitTypeName]
		, z.ZIPCODE_CITY			AS [PostOfficeCity]
		, z.ZIPCODE_STATE			AS [PostOfficeState]
		, PERMIT_POSTOFFICE			AS [PostOfficeZipCode]
		--, PERMIT_ZIPCODE
		--, PERMIT_ROWVERSION
	FROM
		[usps].Permits AS p		
		INNER JOIN [usps].[PermitTypes] AS t
			ON p.PERMIT_TYPEID = t.PERMITTYPE_ID
		INNER JOIN [maponics].[ZipCodes] AS z
			ON p.PERMIT_POSTOFFICE = z.ZIPCODE_ID
		INNER JOIN [dbo].[Clients] AS c
			ON p.PERMIT_CLIENTID = c.CLIENT_ID
		INNER JOIN [dbo].[Relationships] AS r
			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
				AND r.RELATIONSHIP_USERID = @ID
				OR p.PERMIT_GLOBAL = 1
	WHERE
		(p.PERMIT_NUMBER LIKE '%' + @Substring + '%')
		--OR (p.PERMIT_COMPANY LIKE '%' + @Substring + '%')
		--OR (z.ZIPCODE_CITY LIKE '%' + @Substring + '%')
		--OR (z.ZIPCODE_STATE LIKE '%' + @Substring + '%')
		--OR (p.PERMIT_POSTOFFICE LIKE '%' + @Substring + '%')
		--OR (CLIENT_NAME LIKE '%' + @Substring + '%')
		--OR (CLIENT_SHORTNAME LIKE '%' + @Substring + '%')
END
GO