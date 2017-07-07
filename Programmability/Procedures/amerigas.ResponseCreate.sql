SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [amerigas].[ResponseCreate]
	@Address1		nvarchar(60) = NULL
	, @Address2		nvarchar(60) = NULL
	, @Address3		nvarchar(60) = NULL
	, @City			nvarchar(28) = NULL
	, @Company		nvarchar(50) = NULL
	, @EmailAddress	nvarchar(320) = NULL
	, @FirstName	nvarchar(20) = NULL
	, @LastName		nvarchar(20) = NULL
	, @MailPieceID	int	
	, @OtherUsage	nvarchar(100) = NULL
	, @PhoneNumber	nvarchar(15) = NULL
	, @State		char(2) = NULL
	, @Updated		datetime
	, @Usage		int
	, @ZipCode		char(9)

AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE [amerigas].[Responses] WHERE RESPONSE_MAILPIECEID = @MailPieceID;

	INSERT [amerigas].Responses
	(
		RESPONSE_ADDRESS1
		, RESPONSE_ADDRESS2
		, RESPONSE_ADDRESS3
		, RESPONSE_CITY
		, RESPONSE_COMPANY
		, RESPONSE_EMAIL
		, RESPONSE_FIRSTNAME
		, RESPONSE_LASTNAME
		, RESPONSE_MAILPIECEID
		, RESPONSE_OTHER
		, RESPONSE_PHONE
		, RESPONSE_STATE
		, RESPONSE_UPDATED
		, RESPONSE_USAGE
		, RESPONSE_ZIPCODE
	)
	OUTPUT inserted.RESPONSE_ID AS [ID], inserted.RESPONSE_ROWVERSION AS [Version]
	VALUES
	(
		@Address1
		, @Address2
		, @Address3
		, @City
		, @Company
		, @EmailAddress
		, @FirstName
		, @LastName
		, @MailPieceID
		, @OtherUsage
		, @PhoneNumber
		, @State
		, @Updated
		, @Usage
		, @ZipCode
	)

END
GO