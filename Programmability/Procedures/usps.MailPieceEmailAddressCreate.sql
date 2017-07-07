SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceEmailAddressCreate]	
	@CompanyName	nvarchar(100)
	, @CustomField1	sql_variant = NULL
	, @CustomField2	sql_variant = NULL
	, @CustomField3	sql_variant = NULL
	, @CustomField4	sql_variant = NULL
	, @CustomField5	sql_variant = NULL
	, @EmailAddress	nvarchar(320)
	, @FirstName	nvarchar(50) = NULL
	, @LastName		nvarchar(50) = NULL	
	, @MailPieceID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailPieceEmailAddresses]
	(
		ADDRESS_COMPANYNAME
		, ADDRESS_CUSTOMFIELD1
		, ADDRESS_CUSTOMFIELD2
		, ADDRESS_CUSTOMFIELD3
		, ADDRESS_CUSTOMFIELD4
		, ADDRESS_CUSTOMFIELD5
		, ADDRESS_EMAILADDRESS
		, ADDRESS_FIRSTNAME
		, ADDRESS_LASTNAME
		, ADDRESS_MAILPIECEID
	)
	OUTPUT inserted.ADDRESS_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@CompanyName
		, @CustomField1
		, @CustomField2
		, @CustomField3
		, @CustomField4
		, @CustomField5
		, @EmailAddress
		, @FirstName
		, @LastName
		, @MailPieceID
	);
END
GO