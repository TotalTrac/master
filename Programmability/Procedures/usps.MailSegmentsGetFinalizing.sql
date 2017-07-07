SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailSegmentsGetFinalizing]	
	@ClientID	int = NULL 	
	, @DateTime date
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		seg.MAILSEGMENT_ID
		, scf.SCF_NDCID		
	FROM
		[dbo].[MailSegments] AS seg
		INNER JOIN [dbo].[MailPieceScans] AS scan
			ON seg.MAILSEGMENT_FIRSTFINALIZESCANID = scan.MAILPIECESCAN_ID		
		INNER JOIN [dbo].[MailPieces] AS p
			ON scan.MAILPIECESCAN_MAILPIECEID = p.MAILPIECE_ID
		INNER JOIN [dbo].[Scfs] AS scf
			ON p.MAILPIECE_SCFID = scf.SCF_ID	
	WHERE
		DATEDIFF(DAY, seg.MAILSEGMENT_DROPDATE, @DateTime) < 45
		AND usps.GetDeliveryDateFromScan(seg.MAILSEGMENT_FIRSTFINALIZESCANID) = @DateTime
	GROUP BY
		seg.MAILSEGMENT_ID
		, scf.SCF_NDCID
	
	--OPTION (RECOMPILE)

END
GO