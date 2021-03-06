﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPiecesGetWithFieldsByMailingID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		MAILPIECE_ID
		, p.MAILPIECE_ADDRESS1
		, p.MAILPIECE_ADDRESS2
		, p.MAILPIECE_ADDRESS3
		, p.MAILPIECE_CITY
		, p.MAILPIECE_COMPANY
		, p.MAILPIECE_CRRT
		, p.MAILPIECE_DELIVERYDATE
		, p.MAILPIECE_FIRSTNAME
		, p.MAILPIECE_FIRSTSCANID
		, p.MAILPIECE_FINALIZESCANID
		, p.MAILPIECE_FORWARDSCANID
		, p.MAILPIECE_GROUPID
		, p.MAILPIECE_INDIVIDUALID
		, p.MAILPIECE_LASTNAME
		, p.MAILPIECE_LASTSCANID
		, p.MAILPIECE_ROUTINGCODE
		, p.MAILPIECE_SCFID
		, p.MAILPIECE_SEGMENTID
		, p.MAILPIECE_RETURNSCANID
		, p.MAILPIECE_STATE
		, p.MAILPIECE_TARGETID
		, p.MAILPIECE_TITLE
		, p.MAILPIECE_TRACKINGCODE
		, p.MAILPIECE_ZIPCODE
		, p.MAILPIECE_ZIPCODEEXT
		, f.FIELD_NAME AS			[MAILPIECE_FIELDNAME]
		, f.FIELD_VALUE AS			[MAILPIECE_FIELDVALUE]
	FROM 
		dbo.MailPieces AS p
		INNER JOIN dbo.MailPieceFields AS f
			ON p.MAILPIECE_ID = f.FIELD_MAILPIECEID
		INNER JOIN dbo.MailSegments AS s
			ON p.MAILPIECE_SEGMENTID = s.MAILSEGMENT_ID
	 WHERE 
		s.MAILSEGMENT_JOBID = @ID;
END
GO