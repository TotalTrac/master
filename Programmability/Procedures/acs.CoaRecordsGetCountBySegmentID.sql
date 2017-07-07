SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[CoaRecordsGetCountBySegmentID]
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
	WHERE
		p.MAILPIECE_SEGMENTID = @ID;
END
GO