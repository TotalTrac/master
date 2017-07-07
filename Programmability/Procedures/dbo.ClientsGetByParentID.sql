﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientsGetByParentID]
	@ID	int = NULL
AS
BEGIN
	SET NOCOUNT ON;

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
		, CLIENT_URL
    , CLIENT_TYPE
		, CLIENT_VENDOR
		, CLIENT_ROWVERSION 
	FROM 
		[dbo].[Clients]
	WHERE
		(@ID IS NULL AND CLIENT_PARENTID IS NULL)
		OR (@ID = CLIENT_PARENTID) 
	ORDER BY 
		CLIENT_ID;
END
GO