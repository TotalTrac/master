SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[RecordCreate]
		@LeadId				int
		,@PrefixTtl			varchar(4)
        ,@IndividualName	varchar(70)
        ,@FirstName			varchar(35)
        ,@MiddleName		varchar(1)
        ,@LastName			varchar(35)
        ,@Address			varchar(50)
        ,@Address2Line		varchar(35)
        ,@City				varchar(30)
        ,@State				varchar(2)
		,@CarrierRoute		char(4)
		,@DSFWalkSequence	varchar(4)
		,@County			varchar(3)
		,@PostSuppPhone		varchar(10)
		,@SecPhoneFlag		varchar(1)
        ,@DayOfWeek			smallint
		,@DepotId			int
		,@Discount			decimal(4,3) = NULL
		,@Rate				decimal(4,3) = NULL
        ,@ScfDiscount		decimal(4, 3) = NULL
		,@ScfID				int = NULL
		,@IsSeed			bit = 0
		,@Week				smallint
		,@Year				smallint
		,@ZipCode			char(9)
		,@ZipCodeName		char(10)
		,@Dpbc				varchar(3)
        




AS
BEGIN
	SET NOCOUNT ON;
	    
	INSERT [StVincent].Records
	(	
		[RECORD_LEADID],
		[RECORD_PREFIXTTL],
		[RECORD_INDIVIDUALNAME],
		[RECORD_FIRSTNAME] ,
		[RECORD_MIDDLENAME] ,
		[RECORD_LASTNAME],
		[RECORD_ADDRESS] ,
		[RECORD_ADDRESS2LINE] ,
		[RECORD_CITY] ,
		[RECORD_STATE],
		[RECORD_CARRIERROUTE] ,
		[RECORD_DSFWALKSEQUENCE] ,
		[RECORD_COUNTY] ,
		[RECORD_POSTSUPPPHONE] ,
		[RECORD_SECPHONEFLAG] ,
		[RECORD_DAYOFWEEK] ,
		[RECORD_DEPOTID] ,
		[RECORD_DISCOUNT],
		[RECORD_RATE] ,
		[RECORD_SCFDISCOUNT] ,
		[RECORD_SCFID] ,
		[RECORD_SEED] ,
		[RECORD_WEEK] ,
		[RECORD_YEAR] ,
		[RECORD_ZIPCODE] ,		
		[RECORD_ZIPCODENAME] ,
		[RECORD_DPBC] 
	)
	OUTPUT inserted.RECORD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@LeadId
		,@PrefixTtl			
        ,@IndividualName	
        ,@FirstName			
        ,@MiddleName		
        ,@LastName			
        ,@Address			
        ,@Address2Line		
        ,@City				
        ,@State				
		,@CarrierRoute		
		,@DSFWalkSequence	
		,@County			
		,@PostSuppPhone		
		,@SecPhoneFlag		
        ,@DayOfWeek			
		,@DepotId			
		,@Discount			
		,@Rate				
        ,@ScfDiscount		
		,@ScfID				
		,@IsSeed			
		,@Week				
		,@Year				
		,@ZipCode			
		,@ZipCodeName		
		,@Dpbc			
	);
END
GO