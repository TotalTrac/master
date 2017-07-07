SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[NixieRecordCreate]
	@AcsTypeId					int
	, @CaptureTypeId			int
	, @DeliverabilityCodeID		int
	, @FeeNotificationTypeID	int	
	, @FulfillmentDate			date
	, @HardcopyFlag				char(1)
	, @IdTag					char(16)
	, @Impb						char(35)
	, @MailActionCodeId			int
	, @MailerId					char(9)
	, @MailPieceID				int
	, @MailShapeId				int	
	, @NotificationTypeID		int
	, @PostageDue				decimal(4, 2) = NULL
	, @PostalServiceSiteID		int
	, @ProcessingTypeId			int 	
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT [acs].[NixieRecords]
	(    
	   [RECORD_ACSTYPEID]
      ,[RECORD_CAPTURETYPEID]
      ,[RECORD_DELIVERABILITYCODEID]
      ,[RECORD_FEENOTIFICATIONTYPEID]
      ,[RECORD_FULFILLMENTDATE]
      ,[RECORD_HARDCOPYFLAG]
      ,[RECORD_IDTAG]
	  ,[RECORD_IMPB]
      ,[RECORD_MAILACTIONCODEID]
      ,[RECORD_MAILERID]
      ,[RECORD_MAILPIECEID]
      ,[RECORD_MAILSHAPEID]
      ,[RECORD_NOTIFICATIONTYPEID]
      ,[RECORD_POSTAGEDUE]
      ,[RECORD_POSTALSERVICESITEID]
      ,[RECORD_PROCESSINGTYPEID]	
	)
	OUTPUT inserted.RECORD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@AcsTypeId
		, @CaptureTypeId
		, @DeliverabilityCodeID
		, @FeeNotificationTypeID
		, @FulfillmentDate
		, @HardcopyFlag
		, @IdTag
		, @Impb
		, @MailActionCodeId
		, @MailerId
		, @MailPieceID
		, @MailShapeId
		, @NotificationTypeID
		, @PostageDue
		, @PostalServiceSiteID
		, @ProcessingTypeId
	);
END
GO