SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientLocationCreate]
	@Address1			nvarchar(100) = NULL
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
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [dbo].[ClientLocations]
	(
		
		ADDRESS1	
		, ADDRESS2
    , ADDRESS3
    , ADDRESS4		
    , ADDRESSType	
		, CITY			
		, CLIENTID	
		, CODE		
		, CONTACT	
    , COUNTRYID	
		, EMAIL		
		, FAX			
		, NAME		
		, PHONE		
    , PlacesId
		, POSTALCODE	
    , TOLLFREE	
		, REGION			
	)
	OUTPUT
		inserted.ID AS ID, inserted.ROWVERSION AS [VERSION]
	VALUES
	(
			@Address1
	, @Address2			
  , @Address3			
  , @Address4			
  , @AddressType	
	, @City				
	, @ClientID		
	, @Code				
  , @Contact	
  , @Country			
	, @Email			
	, @Fax				
	, @Name				
	, @Phone			
  , @PlacesId
	, @PostalCode	
  , @TollFree		
	, @Region			
  
	);
END
GO