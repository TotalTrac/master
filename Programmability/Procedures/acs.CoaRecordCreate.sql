SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[CoaRecordCreate]
  @AcsTypeId          INT =  NULL
  , @CaptureTypeId      INT  = NULL
	, @CompanyName				varchar(47) = NULL
	, @DeliverabilityCodeID		int
	, @EffectiveDate			date
	, @FeeNotificationTypeID	int	
	, @FirstName				  varchar(15) = NULL
  , @FulfillmentDate    DATE = NULL
  , @HardcopyFlag       CHAR(1) = NULL
  , @IdTag              CHAR(16) = NULL
  , @Impb               CHAR(35) = NULL
	, @LastName					varchar(20) = NULL
	, @MadeAvailable    DATE = NULL
	  , @MailActionCodeId INT = NULL
	  , @MailerId         CHAR(9)
	  , @MailPieceID				INT
	  , @MailShapeId      INT = NULL
	, @MoveTypeID				int
	, @NamePrefix				varchar(6) = NULL
	, @NameSuffix				varchar(6) = NULL
	, @NewAddressTypeID			int = NULL
	, @NewCheckDigit			smallint = NULL
	, @NewCity					varchar(28) = NULL
	, @NewDeliveryPoint			int
	, @NewPostDirectional		char(2) = NULL
	, @NewPreDirectional		char(2) = NULL
	, @NewPrimaryNumber			varchar(10) = NULL
	, @NewSecondaryNumber		varchar(10) = NULL
	, @NewState					char(2) = NULL
	, @NewStreetName			varchar(28) = NULL
	, @NewStreetSuffix			char(4) = NULL
	, @NewUnitDesignator		char(4) = NULL
	, @NewUrbanization			varchar(28) = NULL
	, @NewZipCode				char(5) = NULL
	, @NewZipCodeAddOn			char(4) = NULL
	, @NotificationTypeID		int
	, @OldAddressTypeID			int = NULL
	, @OldCity					varchar(28) = NULL
	, @OldPostDirectional		char(2) = NULL
	, @OldPredirectional		char(2) = NULL
	, @OldPrimaryNumber			varchar(10) = NULL
	, @OldSecondaryNumber		varchar(10) = NULL
	, @OldState					char(2) = NULL
	, @OldStreetName			varchar(28) = NULL  
	, @OldStreetSuffix			char(4) = NULL
	, @OldUnitDesignator		char(4) = NULL
	, @OldUrbanization			varchar(28) = NULL
	, @OldZipCode				char(5) = NULL
	, @PostageDue				decimal(4, 2) = NULL
	, @PostalServiceSiteID		int 
	, @PrivateMailBox			char(8) = NULL
  , @ProcessingTypeId   INT = NULL
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT [acs].[CoaRecords]
	(   [RECORD_ACSTYPEID]
    , [RECORD_CAPTURETYPEID]
		, [RECORD_COMPANYNAME] 
		, [RECORD_DELIVERABILITYCODEID]
		, [RECORD_EFFECTIVEDATE]
		, [RECORD_FEENOTIFICATIONTYPEID]
		, [RECORD_FIRSTNAME]
    , [RECORD_FULFILLMENTDATE]
    , [RECORD_HARDCOPYFLAG]
    , [RECORD_IDTAG]
    , [RECORD_IMPB]
		, [RECORD_LASTNAME]
    , [RECORD_MADEAVAILABLE]
    , [RECORD_MAILACTIONCODEID]
    , [RECORD_MAILERID]
		, [RECORD_MAILPIECEID]
    , [RECORD_MAILSHAPEID]
		, [RECORD_MOVETYPEID]
		, [RECORD_NAMEPREFIX]
		, [RECORD_NAMESUFFIX]
		, [RECORD_NEWADDRESSTYPEID]
		, [RECORD_NEWCHECKDIGIT]
		, [RECORD_NEWCITY]
		, [RECORD_NEWDELIVERYPOINT]
		, [RECORD_NEWPOSTDIRECTIONAL]
		, [RECORD_NEWPREDIRECTIONAL]
		, [RECORD_NEWPRIMARYNUMBER]
		, [RECORD_NEWSECONDARYNUMBER]
		, [RECORD_NEWSTATE]
		, [RECORD_NEWSTREETNAME]
		, [RECORD_NEWSTREETSUFFIX]
		, [RECORD_NEWUNITDESIGNATOR]
		, [RECORD_NEWURBANIZATION]
		, [RECORD_NEWZIPCODE]
		, [RECORD_NEWZIPCODEADDON]
		, [RECORD_NOTIFICATIONTYPEID]
		, [RECORD_OLDADDRESSTYPEID]
		, [RECORD_OLDCITY]
		, [RECORD_OLDPOSTDIRECTIONAL]
		, [RECORD_OLDPREDIRECTIONAL]
		, [RECORD_OLDPRIMARYNUMBER]
		, [RECORD_OLDSECONDARYNUMBER]
		, [RECORD_OLDSTATE]
		, [RECORD_OLDSTREETNAME]
		, [RECORD_OLDSTREETSUFFIX]
		, [RECORD_OLDUNITDESIGNATOR]
		, [RECORD_OLDURBANIZATION]
		, [RECORD_OLDZIPCODE]
		, [RECORD_POSTAGEDUE]
		, [RECORD_POSTALSERVICESITEID]
		, [RECORD_PRIVATEMAILBOX]
    , [RECORD_PROCESSINGTYPEID]
	)
	OUTPUT inserted.RECORD_ID AS [ID], NULL AS [Version]
	VALUES
	(
    @AcsTypeId
    , @CaptureTypeId
		, @CompanyName
		, @DeliverabilityCodeID
		, @EffectiveDate
		, @FeeNotificationTypeID
		, @FirstName
    , @FulfillmentDate
    , @HardcopyFlag
    , @IdTag
    , @Impb
		, @LastName
    , @MadeAvailable
    , @MailActionCodeId
		, @MailerId
    , @MailPieceID
    , @MailShapeId
		, @MoveTypeID
		, @NamePrefix
		, @NameSuffix
		, @NewAddressTypeID
		, @NewCheckDigit
		, @NewCity
		, @NewDeliveryPoint
		, @NewPostDirectional
		, @NewPreDirectional
		, @NewPrimaryNumber
		, @NewSecondaryNumber
		, @NewState
		, @NewStreetName
		, @NewStreetSuffix
		, @NewUnitDesignator
		, @NewUrbanization
		, @NewZipCode
		, @NewZipCodeAddOn
		, @NotificationTypeID
		, @OldAddressTypeID
		, @OldCity
		, @OldPostDirectional
		, @OldPredirectional
		, @OldPrimaryNumber
		, @OldSecondaryNumber
		, @OldState
		, @OldStreetName
		, @OldStreetSuffix
		, @OldUnitDesignator
		, @OldUrbanization
		, @OldZipCode
		, @PostageDue
		, @PostalServiceSiteID
		, @PrivateMailBox
    , @ProcessingTypeId
	);
END
GO