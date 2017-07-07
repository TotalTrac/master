SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientCreate]
	@Address1			nvarchar(100) = NULL
	, @Address2			nvarchar(100) = NULL
	, @Branded			bit
	, @City				nvarchar(50) = NULL
	, @Contact			nvarchar(50) = NULL
	, @Created			datetime
	, @CreatedByID		INT
  , @ClientType     INT = NULL
	, @Email			nvarchar(320) = NULL	
	, @FavIcon			nvarchar(255) = NULL
	, @Fax				char(15) = NULL
	, @Internal			int
	, @LegalName		nvarchar(200) = NULL	
	, @Name				nvarchar(100)
	--, @NonProfitAuth	char(10) = NULL
	, @ParentID			int = NULL
	, @Phone			char(15) = NULL
	, @PostalCode		nchar(15) = NULL
	, @Region			nvarchar(50) = NULL
	, @ShortName		nvarchar(50)
	, @Stylesheet		nvarchar(50) = NULL
	, @Subdomain		nvarchar(50) = NULL
	, @Url				nvarchar(255) = NULL
	, @Vendor			bit
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT Clients	
	(
		CLIENT_ADDRESS1
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
	)
	OUTPUT
		inserted.CLIENT_ID AS ID, inserted.CLIENT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Address1
		, @Address2
		, @Branded
		, @City
		, @Contact
		, @Created
		, @CreatedByID
		, @Email
		, @FavIcon
		, @Fax
		, @Internal
		, @LegalName
		, @Name
		--, @NonProfitAuth
		, @ParentID
		, @Phone
		, @PostalCode
		, @Region
		, @ShortName
		, @Stylesheet
		, @Subdomain
    , @ClientType
		, @Url
		, @Vendor
	);
END
GO