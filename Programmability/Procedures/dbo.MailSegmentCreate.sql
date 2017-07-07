SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentCreate]
	@AccessibilityLevelID	int = NULL 
  , @BillingStatus  INT=NULL
  , @BillingInvoiceId INT = NULL
  , @CommentThreadId INT = NULL
	, @ComminglerID			int = NULL
	, @CompleteMail			bit = NULL
	, @CreatedByID			int
	, @CridId				int = NULL
	, @DataDue				date = NULL
	, @Description			nvarchar(500) = NULL
	, @DestinationAnalysis	int = NULL
	, @DropDate				date = NULL
	, @EntryPoint			char(5) = NULL
	, @EstimatedQuantity	int = NULL
	, @FirstFinalizeScanID	int = NULL
	, @FirstScanID			int = NULL	
	, @ComminglerSegmentId	int = NULL
	, @IsMailAnywhere		bit = NULL
	, @JobID				int	
	, @LastFinalizeScanID	int = NULL
	, @LastScanID			int = NULL
	, @MailAnywhereAcctNo	varchar(50) = NULL
	, @MailStreamID			int = NULL
	, @MatchMail			bit = NULL
	, @MaterialDue			date = NULL
	, @MeterRate			float = NULL
	, @Name					nvarchar (50)
	, @NonProfit			int	= NULL
	, @Outgoing				bit
	, @PermitID				int = NULL
	, @PieceHeight			float = NULL
	, @PieceLength			float = NULL
	, @PieceThickness		float = NULL
	, @PieceTypeID			int = NULL
	, @PieceWeight			float = NULL
	, @PostageAppliedID		int = NULL
	, @PostalClassID		int = NULL
	, @Presorted			bit = NULL
	, @SegmentTypeID		int = NULL	
	, @SpecialPreparation	int = NULL
	, @TargetDate			date = NULL
	, @TrackingType			int	
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[MailSegments]
	(
		MAILSEGMENT_ACCESSIBILITYLEVELID
    , MAILSEGMENT_BILLINGSTATUS
    , MAILSEGMENT_BILLINGINVOICEID
    , MAILSEGMENT_COMMENTTHREADID
		, MAILSEGMENT_COMMINGLERID
		, MAILSEGMENT_COMPLETEMAIL
		, MAILSEGMENT_CREATED
		, MAILSEGMENT_CREATEDBYID
		, MAILSEGMENT_CRIDID
		, MAILSEGMENT_DATADUE
		, MAILSEGMENT_DESCRIPTION
		, MAILSEGMENT_DESTINATIONANALYSIS
		, MAILSEGMENT_DROPDATE
		, MAILSEGMENT_ENTRYPOINT
		, MAILSEGMENT_ESTQTY
		, MAILSEGMENT_FIRSTFINALIZESCANID
		, MAILSEGMENT_FIRSTSCANID		
		, MAILSEGMENT_COMMINGLERSEGMENTID
		, MAILSEGMENT_ISMAILANYWHERE
		, MAILSEGMENT_JOBID
		, MAILSEGMENT_LASTFINALIZESCANID
		, MAILSEGMENT_LASTSCANID
		, MAILSEGMENT_MAILANYWHEREACCTNO
		, MAILSEGMENT_MAILSTREAMID
		, MAILSEGMENT_MATCHMAIL		
		, MAILSEGMENT_MATERIALDUE
		, MAILSEGMENT_METERRATE		
		, MAILSEGMENT_NAME
		, MAILSEGMENT_NONPROFIT
		, MAILSEGMENT_OUTGOING	
		, MAILSEGMENT_PERMITID
		, MAILSEGMENT_PIECEHEIGHT
		, MAILSEGMENT_PIECELENGTH
		, MAILSEGMENT_PIECETHICKNESS
		, MAILSEGMENT_PIECETYPEID
		, MAILSEGMENT_PIECEWEIGHT
		, MAILSEGMENT_POSTAGEAPPLIEDID
		, MAILSEGMENT_POSTALCLASSID
		, MAILSEGMENT_PRESORTED
		, MAILSEGMENT_SEGMENTTYPEID		
		, MAILSEGMENT_SPECIALPREPARATION
		, MAILSEGMENT_TARGETDATE
		, MAILSEGMENT_TRACKINGTYPEID				
	) 
	OUTPUT		
		inserted.MAILSEGMENT_ID AS ID, inserted.MAILSEGMENT_ROWVERSION AS [VERSION]
	VALUES 
	(
		@AccessibilityLevelID
    , @BillingStatus
    , @BillingInvoiceId
    , @CommentThreadId
		, @ComminglerID
		, @CompleteMail
		, GETUTCDATE()
		, @CreatedByID
		, @CridId
		, @DataDue
		, @Description
		, @DestinationAnalysis
		, @DropDate
		, @EntryPoint
		, @EstimatedQuantity
		, @FirstFinalizeScanID
		, @FirstScanID
		, @ComminglerSegmentId		
		, @IsMailAnywhere		
		, @JobID
		, @LastFinalizeScanID
		, @LastScanID
		, @MailAnywhereAcctNo
		, @MailStreamID
		, @MatchMail
		, @MaterialDue
		, @MeterRate
		, @Name
		, @NonProfit
		, @Outgoing
		, @PermitID
		, @PieceHeight
		, @PieceLength
		, @PieceThickness
		, @PieceTypeID
		, @PieceWeight
		, @PostageAppliedID
		, @PostalClassID
		, @Presorted
		, @SegmentTypeID		
		, @SpecialPreparation
		, @TargetDate
		, @TrackingType			
	);
END
GO