SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentUpdate] 
	@ID						int
	, @AccessibilityLevelID	int = NULL	
  , @BillingStatus  INT = NULL
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
	, @ComminglerSegmentId	int 
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
	, @Version				timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE
		[dbo].[MailSegments]
	SET
		MAILSEGMENT_ACCESSIBILITYLEVELID	= @AccessibilityLevelID	
    , MAILSEGMENT_BILLINGSTATUS     = @BillingStatus
    , MAILSEGMENT_BILLINGINVOICEID  = @BillingInvoiceId
    , MAILSEGMENT_COMMENTTHREADID = @CommentThreadId
		, MAILSEGMENT_COMMINGLERID			= @ComminglerID
		, MAILSEGMENT_COMPLETEMAIL			= @CompleteMail
		, MAILSEGMENT_CRIDID				= @CridId
		, MAILSEGMENT_DATADUE				= @DataDue
		, MAILSEGMENT_DESCRIPTION			= @Description
		, MAILSEGMENT_DESTINATIONANALYSIS	= @DestinationAnalysis
		, MAILSEGMENT_DROPDATE				= @DropDate
		, MAILSEGMENT_ENTRYPOINT			= @EntryPoint
		, MAILSEGMENT_ESTQTY				= @EstimatedQuantity
		, MAILSEGMENT_FIRSTFINALIZESCANID	= @FirstFinalizeScanID
		, MAILSEGMENT_FIRSTSCANID			= @FirstScanID		
		, MAILSEGMENT_COMMINGLERSEGMENTID	= @ComminglerSegmentId
		, MAILSEGMENT_ISMAILANYWHERE		= @IsMailAnywhere
		, MAILSEGMENT_JOBID					= @JobID		
		, MAILSEGMENT_LASTFINALIZESCANID	= @LastFinalizeScanID
		, MAILSEGMENT_LASTSCANID			= @LastScanID
		, MAILSEGMENT_NAME					= @Name		
		, MAILSEGMENT_MAILANYWHEREACCTNO	= @MailAnywhereAcctNo
		, MAILSEGMENT_MAILSTREAMID			= @MailStreamID
		, MAILSEGMENT_MATCHMAIL				= @MatchMail
		, MAILSEGMENT_MATERIALDUE			= @MaterialDue
		, MAILSEGMENT_METERRATE				= @MeterRate
		, MAILSEGMENT_NONPROFIT				= @NonProfit
		, MAILSEGMENT_OUTGOING				= @Outgoing
		, MAILSEGMENT_PERMITID				= @PermitID
		, MAILSEGMENT_PIECEHEIGHT			= @PieceHeight
		, MAILSEGMENT_PIECELENGTH			= @PieceLength
		, MAILSEGMENT_PIECETHICKNESS		= @PieceThickness
		, MAILSEGMENT_PIECETYPEID			= @PieceTypeID
		, MAILSEGMENT_PIECEWEIGHT			= @PieceWeight
		, MAILSEGMENT_POSTAGEAPPLIEDID		= @PostageAppliedID
		, MAILSEGMENT_POSTALCLASSID			= @PostalClassID
		, MAILSEGMENT_PRESORTED				= @Presorted
		, MAILSEGMENT_SEGMENTTYPEID			= @SegmentTypeID		
		, MAILSEGMENT_SPECIALPREPARATION	= @SpecialPreparation
		, MAILSEGMENT_TARGETDATE			= @TargetDate
		, MAILSEGMENT_TRACKINGTYPEID		= @TrackingType		
	OUTPUT		
		inserted.MAILSEGMENT_ID AS ID, inserted.MAILSEGMENT_ROWVERSION AS [VERSION]	
	WHERE
		(MAILSEGMENT_ID = @ID) 
		AND (MAILSEGMENT_ROWVERSION = @Version);


  UPDATE job.Kits 
  SET 
	EstimatedQty = @EstimatedQuantity,
    DropDate = @DropDate
  WHERE 
	SegmentId = @ID;
END
GO