SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [usps].[PermitUpdate] 
	@ID int
	, @AccountNumber			char(10) = NULL
	, @Address1					nvarchar(30) = NULL
	, @Address2					nvarchar(30) = NULL
	, @City						nvarchar(50) = NULL
	, @ClientID					int
	, @Company					nvarchar(50) = NULL
	, @Created					datetime
	, @CreatedByID				int
	, @ExpirationDate			date = null
	, @Global					bit
	, @Number					char(6)		
	, @PostOffice				char(5)
	, @State					nchar(2) = NULL
	, @TypeID					int	
	, @ZipCode					nchar(9) = NULL
	, @Version					timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[usps].[Permits]
	SET
		PERMIT_ACCOUNTNUMBER			= @AccountNumber
		, PERMIT_ADDRESS1				= @Address1
		, PERMIT_ADDRESS2				= @Address2
		, PERMIT_CITY					= @City
		, PERMIT_CLIENTID				= @ClientID
		, PERMIT_COMPANY				= @Company	
		, PERMIT_EXPIRATIONDATE			= @ExpirationDate	
		, PERMIT_GLOBAL					= @Global		
		, PERMIT_NUMBER					= @Number
		, PERMIT_POSTOFFICE				= @PostOffice				
		, PERMIT_STATE					= @State
		, PERMIT_TYPEID					= @TypeID		
		, PERMIT_ZIPCODE				= @ZipCode
	OUTPUT		
		inserted.PERMIT_ID AS ID, inserted.PERMIT_ROWVERSION AS [VERSION]		
	WHERE 
		(PERMIT_ID = @ID)
		AND (PERMIT_ROWVERSION = @Version);
END
GO