SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserCreate] 
	@Address1			nvarchar(100) = NULL
	, @Address2			nvarchar(100) = NULL
	, @City				nvarchar(50) = NULL
	, @ClientID			int
	, @Created			datetime
	, @CreatedByID		int	
	, @DefaultUrl		nvarchar(200) = NULL	
	, @Fax				char(15) = NULL
	, @FirstName	  nvarchar(50)
	, @InactiveLogout int
	, @LastName	  nvarchar(50)
	, @LockedOut		bit = 0	
	, @Phone			char(15) = NULL
	, @PostalCode		nchar(15) = NULL
	, @Region			nvarchar(50) = NULL
	, @Roles			bigint
	, @SecondaryEmail	nvarchar(50)	
	, @UserName			nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[Users]
	(
		USER_ADDRESS1
		, USER_ADDRESS2
		, USER_CITY
		, USER_CLIENT_ID
		, USER_CREATED
		, USER_CREATEDBY_ID
		, USER_DEFAULTURL		
		, USER_FAX
		, USER_FIRSTNAME
		, USER_INACTIVELOGOUT			
		, USER_LASTNAME
		, USER_LOCKEDOUT
		, USER_PASSWORD		
		, USER_PHONE
		, USER_POSTALCODE
		, USER_REGION	
		, USER_ROLES	
		, USER_SECONDARY_EMAIL
		, USER_USERNAME
	) 
	OUTPUT		
		inserted.USER_USERID AS ID, inserted.USER_ROWVERSION AS [VERSION]
	VALUES 
	(
		@Address1
		, @Address2
		, @City
		, @ClientID
		, @Created
		, @CreatedByID
		, @DefaultUrl
		--, @DisplayName
		, @Fax
		, @FirstName
		, @InactiveLogout
		, @LastName
		, @LockedOut	
		, 0x010203040506453656532312299123123144334556567867853431234454564578887987564543523223423423	
		, @Phone
		, @PostalCode
		, @Region
		, @Roles
		, @SecondaryEmail
		, @UserName		
	);

	INSERT dbo.Relationships
	(
		RELATIONSHIP_CLIENTID
		, RELATIONSHIP_USERID
	)
	VALUES
	(
		@ClientID
		, SCOPE_IDENTITY()
	);
END
GO