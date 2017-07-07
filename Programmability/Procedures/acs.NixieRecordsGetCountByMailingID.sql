SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[NixieRecordsGetCountByMailingID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		COUNT(acs.[RECORD_ID])
	FROM
		[acs].[NixieRecords] AS acs
		INNER JOIN [dbo].[MailPieces] AS p
			ON acs.RECORD_MAILPIECEID = p.MAILPIECE_ID
		INNER JOIN [dbo].[MailSegments] AS s			
			ON p.MAILPIECE_SEGMENTID = s.MAILSEGMENT_ID
	WHERE
		s.MAILSEGMENT_JOBID = @ID;
END
GO