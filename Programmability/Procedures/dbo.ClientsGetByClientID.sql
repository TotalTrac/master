﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientsGetByClientID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	WITH CTE AS
	(
		SELECT 
			CLIENT_ID
			, CLIENT_ADDRESS1
			, CLIENT_ADDRESS2
			, CLIENT_BRANDED
			, CLIENT_CITY
			, CLIENT_CONTACT
			, CLIENT_CREATED
			, CLIENT_CREATEDBYID
			, CLIENT_EMAIL
			, CLIENT_FAVICON
			, CLIENT_FAX
			, CLIENT_INTERNAL
			, CLIENT_LEGALNAME
			, CLIENT_NAME
			--, CLIENT_NONPROFITAUTH
			, CLIENT_PARENTID
			, CLIENT_PHONE
			, CLIENT_POSTALCODE
			, CLIENT_REGION
			, CLIENT_SHORTNAME
			, CLIENT_STYLESHEET
			, CLIENT_SUBDOMAIN
      , CLIENT_TYPE
			, CLIENT_URL
			, CLIENT_VENDOR
			, CLIENT_ROWVERSION 
		FROM
			[dbo].[Clients]
		WHERE
			CLIENT_ID = @ID

		UNION ALL

		SELECT
			c.CLIENT_ID
			, c.CLIENT_ADDRESS1
			, c.CLIENT_ADDRESS2
			, c.CLIENT_BRANDED
			, c.CLIENT_CITY
			, c.CLIENT_CONTACT
			, c.CLIENT_CREATED
			, c.CLIENT_CREATEDBYID
			, c.CLIENT_EMAIL
			, c.CLIENT_FAVICON
			, c.CLIENT_FAX
			, c.CLIENT_INTERNAL
			, c.CLIENT_LEGALNAME
			, c.CLIENT_NAME
			--, c.CLIENT_NONPROFITAUTH
			, c.CLIENT_PARENTID
			, c.CLIENT_PHONE
			, c.CLIENT_POSTALCODE
			, c.CLIENT_REGION
			, c.CLIENT_SHORTNAME
			, c.CLIENT_STYLESHEET
			, c.CLIENT_SUBDOMAIN
      , c.CLIENT_TYPE
			, c.CLIENT_URL
			, c.CLIENT_VENDOR
			, c.CLIENT_ROWVERSION 
		FROM
			[dbo].[Clients] AS c
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID		
	)
	SELECT 
		CLIENT_ID
		, CLIENT_ADDRESS1
		, CLIENT_ADDRESS2
		, CLIENT_BRANDED
		, CLIENT_CITY
		, CLIENT_CONTACT
		, CLIENT_CREATED
		, CLIENT_CREATEDBYID
		, CLIENT_EMAIL
		, CLIENT_FAX
		, CLIENT_INTERNAL
		, CLIENT_LEGALNAME
		, CLIENT_NAME
		--, CLIENT_NONPROFITAUTH
		, CLIENT_PARENTID
		, CLIENT_PHONE
		, CLIENT_POSTALCODE
		, CLIENT_REGION
		, CLIENT_SHORTNAME
		, CLIENT_STYLESHEET
		, CLIENT_SUBDOMAIN
		, CLIENT_URL
		, CLIENT_VENDOR
		, CLIENT_ROWVERSION 
	FROM 
		CTE	
	ORDER BY 
		CLIENT_ID;
END
GO