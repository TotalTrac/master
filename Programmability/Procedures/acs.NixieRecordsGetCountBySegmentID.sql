SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[NixieRecordsGetCountBySegmentID]
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
	WHERE
		p.MAILPIECE_SEGMENTID = @ID;
END
GO