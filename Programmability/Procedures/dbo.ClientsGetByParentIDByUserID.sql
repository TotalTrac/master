﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientsGetByParentIDByUserID]
	@ParentID		int = NULL
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;

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
		INNER JOIN [dbo].[Relationships] AS r
			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	WHERE
		((@ParentID IS NULL AND c.CLIENT_PARENTID IS NULL)
				OR (c.CLIENT_PARENTID = @ParentID))
			AND (r.RELATIONSHIP_USERID = @UserID)
	ORDER BY
		CLIENT_ID;
END
GO