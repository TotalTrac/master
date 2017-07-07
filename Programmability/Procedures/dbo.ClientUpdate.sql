SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ClientUpdate] 
	@ID					int
	, @Address1			nvarchar(100) = NULL
	, @Address2			nvarchar(100) = NULL
	, @Branded			bit
	, @City				nvarchar(50) = NULL
  , @ClientType INT = NULL
	, @Contact			nvarchar(50) = NULL
	, @Created			datetime
	, @CreatedByID		int
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
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Clients]
	SET
		CLIENT_ADDRESS1			= @Address1
		, CLIENT_ADDRESS2		= @Address2
		, CLIENT_BRANDED		= @Branded
		, CLIENT_CITY			= @City
    , CLIENT_TYPE     = @ClientType
		, CLIENT_CONTACT		= @Contact
		, CLIENT_EMAIL			= @Email
		, CLIENT_FAVICON		= @FavIcon	
		, CLIENT_FAX			= @Fax
		, CLIENT_INTERNAL		= @Internal
		, CLIENT_LEGALNAME		= @LegalName
		, CLIENT_NAME			= @Name
		--, CLIENT_NONPROFITAUTH	= @NonProfitAuth
		, CLIENT_PARENTID		= @ParentID
		, CLIENT_PHONE			= @Phone
		, CLIENT_POSTALCODE		= @PostalCode
		, CLIENT_REGION			= @Region
		, CLIENT_SHORTNAME		= @ShortName	
		, CLIENT_STYLESHEET		= @Stylesheet
		, CLIENT_SUBDOMAIN		= @Subdomain
		, CLIENT_URL			= @Url
		, CLIENT_VENDOR			= @Vendor
	OUTPUT
		inserted.CLIENT_ID AS ID, inserted.CLIENT_ROWVERSION AS [VERSION]				
	WHERE
		((CLIENT_ID = @ID) AND
		(CLIENT_ROWVERSION = @Version));
END
GO