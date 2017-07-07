SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [purpleheart].[RecordCreate]	
	@CarrierRoute	char(4)	
	, @DayOfWeek	smallint 	
	, @DepotID		int	
	, @Discount		decimal(4,3)
	, @IsSeed		bit
	, @Rate			decimal(4,3) = NULL
	, @ScfDiscount	decimal(4, 3)
	, @ScfID		int
	, @State		char(2)
	, @Week			smallint
	, @Year			smallint
	, @ZipCode		char(9)
	, @ZipCodeName	char(10)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [purpleheart].[Records]
	(
		RECORD_CARRIERROUTE				
		, RECORD_DAYOFWEEK		
		, RECORD_DEPOTID
		, RECORD_DISCOUNT
		, RECORD_RATE
		, RECORD_SEED
		, RECORD_SCFDISCOUNT
		, RECORD_SCFID
		, RECORD_STATE
		, RECORD_WEEK
		, RECORD_YEAR
		, RECORD_ZIPCODE
		, RECORD_ZIPCODENAME
	)
	OUTPUT inserted.RECORD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@CarrierRoute			
		, @DayOfWeek			
		, @DepotID
		, @Discount
		, @Rate
		, @IsSeed
		, @ScfDiscount	
		, @ScfID
		, @State
		, @Week
		, @Year
		, @ZipCode
		, @ZipCodeName
	)
END
GO