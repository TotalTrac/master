SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[LeadCreate]
	@Address			varchar(200)
	, @CarrierRoute		char(4)
	, @CheckDigit		char(1) = NULL
	, @City				varchar(28)
	, @DeliveryPoint	char(2)
	--, @Endorsement		varchar(31) = NULL
	, @OrderID			int
	--, @Qualification	char(4)	
	, @State			char(2)
	, @Title			varchar(100) = NULL
	, @WalkSequence		char(5)	
	, @ZipCode			char(5)
	, @Zip4				char(4) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	    
	INSERT [acxiom].[Leads]
	(
		LEAD_ADDRESS
		, LEAD_CARRIERROUTE
		, LEAD_CHECKDIGIT
		, LEAD_CITY
		, LEAD_DELIVERYPOINT
		--, LEAD_ENDORSEMENT
		, LEAD_ORDERID
		--, LEAD_QUALIFICATION		
		, LEAD_STATE
		, LEAD_TITLE
		, LEAD_WALKSEQUENCE		
		, LEAD_ZIPCODE
		, LEAD_ZIP4
	)
	OUTPUT inserted.LEAD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@Address
		, @CarrierRoute
		, @CheckDigit
		, @City
		, @DeliveryPoint
		--, @Endorsement
		, @OrderID
		--, @Qualification		
		, @State
		, @Title
		, @WalkSequence		
		, @ZipCode
		, @Zip4
	);
END
GO