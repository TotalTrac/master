﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceGetByTrackingCode]
	@TrackingCode			char(20)
	, @ExpirationThreshold	int	= NULL
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT TOP 1
		p.MAILPIECE_ID		
		, p.MAILPIECE_ADDRESS1
		, p.MAILPIECE_ADDRESS2
		, p.MAILPIECE_ADDRESS3		
		, p.MAILPIECE_CITY
		, p.MAILPIECE_COMPANY
		, p.MAILPIECE_CRRT
		, p.MAILPIECE_DELIVERYDATE
		, p.MAILPIECE_FINALIZESCANID
		, p.MAILPIECE_FIRSTNAME
		, p.MAILPIECE_FORWARDSCANID
		, p.MAILPIECE_GROUPID
		, p.MAILPIECE_INDIVIDUALID
		, p.MAILPIECE_LASTNAME
		, p.MAILPIECE_SEGMENTID
		, p.MAILPIECE_RETURNSCANID
		, p.MAILPIECE_ROUTINGCODE
		, p.MAILPIECE_SCFID
		, p.MAILPIECE_STATE
		, p.MAILPIECE_TITLE
		, p.MAILPIECE_TRACKINGCODE
		, p.MAILPIECE_ZIPCODE
		, p.MAILPIECE_ZIPCODEEXT		
	FROM
		[dbo].[MailPieces] AS p		
		INNER JOIN [dbo].[MailSegments] AS s
			ON p.MAILPIECE_SEGMENTID = s.MAILSEGMENT_ID
	WHERE
		p.MAILPIECE_TRACKINGCODE = @TrackingCode
		AND 
		(
			@ExpirationThreshold IS NULL
			OR @ExpirationThreshold >= DATEDIFF(DAY, s.MAILSEGMENT_DROPDATE, GETUTCDATE())
		)
	ORDER BY
		p.MAILPIECE_ID DESC;
END
GO