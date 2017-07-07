SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UserUpdate] 
	@ID						int
	, @Address1				nvarchar(100) = NULL
	, @Address2				nvarchar(100) = NULL
	, @City					nvarchar(50) = NULL
	, @ClientID				int
	, @Created				datetime
	, @CreatedByID			int	
	, @DefaultUrl			nvarchar(200) = NULL		
	, @Fax				    char(15) = NULL
	, @FirstName			nvarchar(50)
	, @InactiveLogout		int
	, @LastName				nvarchar(50)
	, @LockedOut			bit = 0	
	, @Phone				char(15) = NULL
	, @PostalCode			nchar(15) = NULL
	, @Region				nvarchar(50) = NULL
	, @Roles				bigint
	, @SecondaryEmail		nvarchar(50)	
	, @UserName				nvarchar(50)
	, @Version				timestamp
AS
BEGIN
	IF EXISTS(SELECT USER_USERID FROM [dbo].[Users] WHERE USER_USERNAME = @UserName AND USER_USERID <> @ID)
		RETURN -1;

	SET NOCOUNT ON;

	UPDATE 
		[dbo].[Users] 	
	SET
		USER_ADDRESS1			= @Address1
		, USER_ADDRESS2			= @Address2
		, USER_CLIENT_ID		= @ClientID
		, USER_CITY				= @City
		, USER_DEFAULTURL		= @DefaultUrl		
		, USER_FAX				= @Fax
		, USER_FIRSTNAME		= @FirstName
		, USER_INACTIVELOGOUT	= @InactiveLogout
		, USER_LASTNAME			= @LastName
		, USER_LOCKEDOUT		= @LockedOut
		, USER_PHONE			= @Phone
		, USER_POSTALCODE		= @PostalCode
		, USER_REGION			= @Region	
		, USER_ROLES			= @Roles	
		, USER_SECONDARY_EMAIL	= @SecondaryEmail
		--, USER_USERNAME			= @Username
	OUTPUT		
		inserted.USER_USERID AS ID, inserted.USER_ROWVERSION AS [VERSION]
	WHERE 
		(USER_USERID = @ID)
		AND (USER_ROWVERSION = @Version);
END
GO