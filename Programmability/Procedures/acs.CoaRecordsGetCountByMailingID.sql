﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[CoaRecordsGetCountByMailingID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		COUNT(coa.[RECORD_ID])
	FROM
		[acs].[CoaRecords] AS coa
		INNER JOIN [dbo].[MailPieces] AS p
			ON coa.RECORD_MAILPIECEID = p.MAILPIECE_ID
		INNER JOIN [dbo].[MailSegments] AS s			
			ON p.MAILPIECE_SEGMENTID = s.MAILSEGMENT_ID
	WHERE
		s.MAILSEGMENT_JOBID = @ID;
END
GO