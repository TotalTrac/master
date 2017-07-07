SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceCreate]
	@Address1			nvarchar(60) = NULL
    , @Address2			nvarchar(60) = NULL
    , @Address3			nvarchar(60) = NULL
	, @CarrierRoute		char(4) = NULL
    , @City				nvarchar(20) = NULL
	, @DeliveryDate		date = NULL
    , @Company			nvarchar(50) = NULL
	, @FinalizeScanID	int = NULL
    , @FirstName		nvarchar(20) = NULL
	, @FirstScanID		int = NULL
	, @ForwardScanID	int	= NULL
    , @GroupID			nvarchar(25) = NULL
    , @IndividualID		nvarchar(25) = NULL
    , @LastName			nvarchar(20) = NULL
	, @LastScanID		int = NULL
    , @SegmentID		int
	, @ReturnScanID		int = NULL
    , @RoutingCode		char(11)
    , @ScfID			int
    , @State			char(2) = NULL	
    , @Title			nvarchar(50) = NULL
    , @TrackingCode		char(20)
    , @ZipCode			char(5) = NULL
	, @ZipCodeExt		char(4) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailPieces]
	(
		MAILPIECE_ADDRESS1
		, MAILPIECE_ADDRESS2
		, MAILPIECE_ADDRESS3
		, MAILPIECE_CITY
		, MAILPIECE_COMPANY
		, MAILPIECE_CRRT
		, MAILPIECE_DELIVERYDATE
		, MAILPIECE_FINALIZESCANID
		, MAILPIECE_FIRSTNAME
		, MAILPIECE_FIRSTSCANID
		, MAILPIECE_FORWARDSCANID
		, MAILPIECE_GROUPID
		, MAILPIECE_INDIVIDUALID
		, MAILPIECE_LASTNAME
		, MAILPIECE_LASTSCANID
		, MAILPIECE_RETURNSCANID
		, MAILPIECE_SEGMENTID
		, MAILPIECE_ROUTINGCODE
		, MAILPIECE_SCFID
		, MAILPIECE_STATE		
		, MAILPIECE_TITLE
		, MAILPIECE_TRACKINGCODE
		, MAILPIECE_ZIPCODE
		, MAILPIECE_ZIPCODEEXT
	)
	OUTPUT
		inserted.MAILPIECE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Address1
		, @Address2
		, @Address3
		, @City
		, @Company
		, @CarrierRoute
		, @DeliveryDate
		, @FinalizeScanID
		, @FirstName
		, @FirstScanID
		, @ForwardScanID
		, @GroupID
		, @IndividualID
		, @LastName
		, @LastScanID
		, @ReturnScanID
		, @SegmentID
		, @RoutingCode
		, @ScfID
		, @State		
		, @Title
		, @TrackingCode
		, @ZipCode
		, @ZipCodeExt
	);
END
GO