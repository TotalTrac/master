SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerUpdate] 
	@ID				int
	, @Address1		nvarchar(100) = NULL
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
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[Comminglers]
	SET
		COMMINGLER_ADDRESS1		= @Address1
		, COMMINGLER_ADDRESS2	= @Address2		
		, COMMINGLER_CITY		= @City
		, COMMINGLER_CONTACT	= @Contact
		, COMMINGLER_EMAIL		= @Email		
		, COMMINGLER_FAX		= @Fax
		, COMMINGLER_INTERNAL	= @Internal
		, COMMINGLER_LEGALNAME	= @LegalName
		, COMMINGLER_NAME		= @Name
		, COMMINGLER_PARENTID	= @ParentID
		, COMMINGLER_PHONE		= @Phone
		, COMMINGLER_POSTALCODE	= @PostalCode
		, COMMINGLER_PUBLIC		= @Public
		, COMMINGLER_REGION		= @Region
		, COMMINGLER_SHORTNAME	= @ShortName	
		, COMMINGLER_URL		= @Url
	OUTPUT
		inserted.COMMINGLER_ID AS ID, inserted.COMMINGLER_ROWVERSION AS [VERSION]				
	WHERE
		((COMMINGLER_ID = @ID) AND
		(COMMINGLER_ROWVERSION = @Version));
END
GO