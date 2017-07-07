SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationUpdate]
	@ID					int
	, @Address1			nvarchar(100) = NULL
	, @Address2			nvarchar(100) = NULL
  , @Address3			nvarchar(100) = NULL
  , @Address4			nvarchar(100) = NULL
  , @AddressType			int = NULL
	, @City				nvarchar(50) = NULL
	, @ClientID			int
	, @Code				char(10) = NULL
  , @Country				nvarchar(50) = NULL
	, @Contact			nvarchar(50) = NULL
	, @Email			nvarchar(320) = NULL		
	, @Fax				char(15) = NULL
	, @Name				nvarchar(100)
	, @Phone			char(15) = NULL
  , @PlacesId   VARCHAR(200) = NULL
	, @PostalCode		nchar(15) = NULL
	, @Region			nvarchar(50) = NULL	
  , @TollFree				char(15) = NULL
	, @Version			timestamp
AS

BEGIN
		
	SET NOCOUNT ON;
		
	UPDATE [dbo].[ClientLocations]
	SET
		ADDRESS1		= @Address1
		, ADDRESS2		= @Address2			
    , ADDRESS3		= @Address3			
    , ADDRESS4		= @Address4			
    , ADDRESSType		= @AddressType			
		, CITY			= @City
		, CLIENTID		= @ClientID
		, CODE			= @Code
		, CONTACT		= @Contact
    , COUNTRYId		= @Country
		, EMAIL		= @Email	
		, FAX			= @Fax
		, NAME			= @Name
		, PHONE		= @Phone
    , PlacesId = @PlacesId  
		, POSTALCODE	= @PostalCode
    , TOLLFREE	= @TollFree
		, REGION		= @Region
	OUTPUT
		inserted.ID AS ID, inserted.ROWVERSION AS [VERSION]
	WHERE
		(ID = @ID)
		AND ([ROWVERSION] = @Version)
END
GO