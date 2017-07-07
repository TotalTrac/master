﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentsFindPaged]	
	@ClientIDs		varchar(100) = NULL
	, @DropDate		datetime = NULL	
	, @JobIDs		varchar(100) = NULL
	, @Name			nvarchar(50) = NULL
	, @Page			int
	, @RowsPerPage	int
	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
		
	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY MAILSEGMENT_ID DESC) AS ResultNum 	
			, s.MAILSEGMENT_ID
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
		WHERE
			(@ClientIDs IS NULL OR @ClientIDs = '' OR MAILSEGMENT_JOBID IN (
				SELECT
					m.JOB_ID
				FROM 
					[dbo].[Jobs] AS m
					INNER JOIN [job].[Jobs] AS j
						ON m.JOB_JOBID = j.JOB_ID
					INNER JOIN IntegerListToTable(@ClientIDs) AS i 
						ON j.JOB_CLIENTID = i.number
			))
			AND (@JobIDs IS NULL OR @JobIDs = '' OR MAILSEGMENT_JOBID IN (
				SELECT
					JOB_ID
				FROM 
					[dbo].[Jobs] AS j
					INNER JOIN IntegerListToTable(@ClientIDs) AS i 
						ON j.JOB_ID = i.number
			))
			AND (@DropDate IS NULL OR MAILSEGMENT_DROPDATE = @DropDate)			
			AND (@Name IS NULL OR @Name = '' OR MAILSEGMENT_NAME LIKE '%' + @Name + '%')
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
END
GO