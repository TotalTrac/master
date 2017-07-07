SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PermitCreate]
	@AccountNumber		char(10) = NULL 
	, @Address1			nvarchar(30) = NULL
	, @Address2			nvarchar(30) = NULL
	, @City				nvarchar(50) = NULL
	, @ClientID			int
	, @Company			nvarchar(50) = NULL	
	, @Created			datetime
	, @CreatedByID		int
	, @ExpirationDate	date = NULL
	, @Global			bit	
	, @Number			char(6)	
	, @PostOffice		char(5)	
	, @State			nchar(2) = NULL
	, @TypeID			int	
	, @ZipCode			nchar(9) = NULL
AS
BEGIN

	SET NOCOUNT ON;
		
	INSERT Permits
	(
		PERMIT_ACCOUNTNUMBER
		, PERMIT_ADDRESS1
		, PERMIT_ADDRESS2
		, PERMIT_CITY
		, PERMIT_CLIENTID
		, PERMIT_COMPANY
		, PERMIT_CREATED
		, PERMIT_CREATEDBYID
		, PERMIT_EXPIRATIONDATE
		, PERMIT_GLOBAL		
		, PERMIT_NUMBER
		, PERMIT_POSTOFFICE				
		, PERMIT_STATE
		, PERMIT_TYPEID
		, PERMIT_ZIPCODE
	) 
	OUTPUT		
		inserted.PERMIT_ID AS ID, inserted.PERMIT_ROWVERSION AS [VERSION]
	VALUES 
	(	
		@AccountNumber
		, @Address1
		, @Address2
		, @City
		, @ClientID
		, @Company
		, @Created
		, @CreatedByID
		, @ExpirationDate
		, @Global		
		, @Number		
		, @PostOffice
		, @State
		, @TypeID
		, @ZipCode
	);
END
GO