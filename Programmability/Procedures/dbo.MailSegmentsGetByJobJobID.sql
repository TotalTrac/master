﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentsGetByJobJobID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		s.MAILSEGMENT_ID
		, s.MAILSEGMENT_ACCESSIBILITYLEVELID	
      , s.MAILSEGMENT_BILLINGSTATUS	
      , s.MAILSEGMENT_BILLINGINVOICEID
      , s.MAILSEGMENT_COMMENTTHREADID
		, s.MAILSEGMENT_COMMINGLERID
		, s.MAILSEGMENT_COMPLETEMAIL
		, s.MAILSEGMENT_CREATED
		, s.MAILSEGMENT_CREATEDBYID
		, s.MAILSEGMENT_CRIDID
		, s.MAILSEGMENT_DATADUE
		, s.MAILSEGMENT_DESCRIPTION
		, s.MAILSEGMENT_DESTINATIONANALYSIS
		, s.MAILSEGMENT_DROPDATE
		, s.MAILSEGMENT_ENTRYPOINT
		, s.MAILSEGMENT_ESTQTY		
		, s.MAILSEGMENT_FIRSTFINALIZESCANID
		, s.MAILSEGMENT_FIRSTSCANID		
		, s.MAILSEGMENT_COMMINGLERSEGMENTID
		, s.MAILSEGMENT_JOBID
		, s.MAILSEGMENT_LASTFINALIZESCANID		
		, s.MAILSEGMENT_LASTSCANID
		, s.MAILSEGMENT_ISMAILANYWHERE
		, s.MAILSEGMENT_MAILANYWHEREACCTNO
		, s.MAILSEGMENT_MATERIALDUE		
		, s.MAILSEGMENT_MATCHMAIL
		, s.MAILSEGMENT_METERRATE
		, s.MAILSEGMENT_NAME		
		, s.MAILSEGMENT_NONPROFIT	
		, s.MAILSEGMENT_OUTGOING		
		, s.MAILSEGMENT_PIECEHEIGHT
		, s.MAILSEGMENT_PIECELENGTH
		, s.MAILSEGMENT_PIECETHICKNESS
		, s.MAILSEGMENT_PIECETYPEID
		, s.MAILSEGMENT_PIECEWEIGHT		
		, s.MAILSEGMENT_POSTAGEAPPLIEDID
		, s.MAILSEGMENT_POSTALCLASSID			
		, s.MAILSEGMENT_PERMITID
		, s.MAILSEGMENT_PRESORTED
		, s.MAILSEGMENT_MAILSTREAMID
		, s.MAILSEGMENT_SEGMENTTYPEID		
		, s.MAILSEGMENT_SPECIALPREPARATION
		, s.MAILSEGMENT_TARGETDATE
		, s.MAILSEGMENT_TRACKINGTYPEID
		, ( SELECT SUM(DISTINCT VERSION_TRIGGEREVENT) 
			FROM [usps].[MailSegmentEmailVersions] 
			WHERE VERSION_SEGMENTID = s.MAILSEGMENT_ID
		  ) 
		  AS MAILSEGMENT_TRIGGEREVENTS				
		, s.MAILSEGMENT_ROWVERSION	
	FROM 
		[dbo].[MailSegments] AS s
		INNER JOIN dbo.Jobs as m on s.MAILSEGMENT_JOBID = m.JOB_ID
		INNER JOIN job.jobs as j on m.JOB_JOBID = j.JOB_ID
	WHERE
		J.JOB_ID = @ID
END
GO