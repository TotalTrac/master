SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerCreate]
	@Address1		nvarchar(100) = NULL
	, @Address2		nvarchar(100) = NULL	
	, @City			nvarchar(50) = NULL
	, @Contact		nvarchar(50) = NULL
	, @Email		nvarchar(320) = NULL		
	, @Fax			char(15) = NULL
	, @Internal		int
	, @LegalName	nvarchar(200) = NULL	
	, @Name			nvarchar(100)
	, @ParentID		int = NULL
	, @Phone		char(15) = NULL
	, @PostalCode	nchar(15) = NULL
	, @Public		bit
	, @Region		nvarchar(50) = NULL
	, @ShortName	nvarchar(50)
	, @Url			nvarchar(255) = NULL
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [dbo].[Comminglers]	
	(
		COMMINGLER_ADDRESS1
		, COMMINGLER_ADDRESS2		
		, COMMINGLER_CITY
		, COMMINGLER_CONTACT
		, COMMINGLER_EMAIL				
		, COMMINGLER_FAX
		, COMMINGLER_INTERNAL
		, COMMINGLER_LEGALNAME
		, COMMINGLER_NAME
		, COMMINGLER_PARENTID
		, COMMINGLER_PHONE
		, COMMINGLER_POSTALCODE
		, COMMINGLER_PUBLIC
		, COMMINGLER_REGION
		, COMMINGLER_SHORTNAME				
		, COMMINGLER_URL
	)
	OUTPUT
		inserted.COMMINGLER_ID AS ID, inserted.COMMINGLER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Address1
		, @Address2
		, @City
		, @Contact
		, @Email
		, @Fax
		, @Internal
		, @LegalName
		, @Name
		, @ParentID
		, @Phone
		, @PostalCode
		, @Public
		, @Region
		, @ShortName		
		, @Url
	);
END
GO