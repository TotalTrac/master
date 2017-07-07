SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPiecesFind]	
	@Address		nvarchar(60) = NULL
	, @Barcode		varchar(31) = NULL
	, @CarrierRoute	char(4) = NULL
	, @City			nvarchar(20) = NULL
	, @Company		nvarchar(50) = NULL
	, @ClientIDs	varchar(100) = NULL	
	, @FirstName	nvarchar(20) = NULL
	, @GroupID		nvarchar(25) = NULL
	, @IndividualID	nvarchar(25) = NULL
	, @LastName		nvarchar(20) = NULL	
	, @ScfIDs		varchar(100) = NULL
	, @SegmentIDs	varchar(100) = NULL
	, @State		nvarchar(2) = NULL
	, @Title		nvarchar(50) = NULL
	, @ZipCode		nvarchar(5)	= NULL
	, @ZipCode4		nvarchar(4) = NULL
	, @DateFrom		date = NULL
	, @DateTo		date = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		MAILPIECE_ID
		, MAILPIECE_ADDRESS1
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
		, MAILPIECE_SEGMENTID
		, MAILPIECE_RETURNSCANID
		, MAILPIECE_ROUTINGCODE
		, MAILPIECE_SCFID
		, MAILPIECE_STATE
		, MAILPIECE_TARGETID
		, MAILPIECE_TITLE
		, MAILPIECE_TRACKINGCODE
		, MAILPIECE_ZIPCODE
		, MAILPIECE_ZIPCODEEXT
	FROM 		
		[dbo].[MailPieces]
		INNER JOIN [dbo].[MailSegments]
			ON MAILPIECE_SEGMENTID = MAILSEGMENT_ID
		INNER JOIN [dbo].[Jobs] AS m
			ON MAILSEGMENT_JOBID = m.JOB_ID
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
	WHERE
		(@Barcode IS NULL OR @Barcode = '' OR MAILPIECE_TRACKINGCODE + MAILPIECE_ROUTINGCODE LIKE '%' + @Barcode + '%')
		--AND (@DateFrom IS NULL OR  @DateFrom <= MAILSEGMENT_DROPDATE)
		--AND (@DateTo IS NULL OR @DateTo >= MAILSEGMENT_DROPDATE)
		AND (@ClientIDs IS NULL OR @ClientIDs = '' OR JOB_CLIENTID IN (
			SELECT
				number
			FROM 
				IntegerListToTable(@ClientIDs)
		))
		AND (@SegmentIDs IS NULL OR @SegmentIDs = '' OR MAILSEGMENT_ID IN (
			SELECT
				number
			FROM 
				IntegerListToTable(@SegmentIDs)
		))
		AND (@ScfIDs IS NULL OR @ScfIDs = '' OR MAILPIECE_SCFID IN (
			SELECT
				number
			FROM 
				IntegerListToTable(@ScfIDs)
		))
		AND (@Address IS NULL OR @Address = '' OR 
			MAILPIECE_ADDRESS1 LIKE '%' + @Address + '%' 
			OR MAILPIECE_ADDRESS2 LIKE '%' + @Address + '%' 
			OR MAILPIECE_ADDRESS3 LIKE '%' + @Address + '%')					
		AND (@CarrierRoute IS NULL OR @CarrierRoute = '' OR '%' + @CarrierRoute + '%' LIKE MAILPIECE_CRRT)
		AND (@City IS NULL OR @City = '' OR MAILPIECE_CITY LIKE '%' + @City + '%')
		AND (@Company IS NULL OR @Company = '' OR MAILPIECE_COMPANY LIKE '%' + @Company + '%')
		AND (@FirstName IS NULL OR @FirstName = '' OR MAILPIECE_FIRSTNAME LIKE '%' + @FirstName + '%')
		AND (@GroupID IS NULL OR @GroupID = '' OR MAILPIECE_GROUPID LIKE '%' + @GroupID + '%')
		AND (@IndividualID IS NULL OR @IndividualID = '' OR MAILPIECE_INDIVIDUALID LIKE '%' + @IndividualID + '%')
		AND (@LastName IS NULL OR @LastName = '' OR MAILPIECE_LASTNAME LIKE '%' + @LastName + '%')
		AND (@State IS NULL OR @State = '' OR MAILPIECE_STATE LIKE '%' + @State + '%')
		AND (@Title IS NULL OR @Title = '' OR MAILPIECE_TITLE LIKE '%' + @Title + '%')
		AND (@ZipCode IS NULL OR @ZipCode = '' OR MAILPIECE_ZIPCODE LIKE '%' + @ZipCode + '%')
		AND (@ZipCode4 IS NULL OR @ZipCode4 = '' OR MAILPIECE_ZIPCODEEXT LIKE '%' + @ZipCode4 + '%')	
	OPTION (RECOMPILE)
END
GO