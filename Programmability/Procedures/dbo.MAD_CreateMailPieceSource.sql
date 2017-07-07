SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MAD_CreateMailPieceSource] 	
AS

-- Create the table if it doesn't exist
IF OBJECT_ID('dbo._MostRecentMADPieces', 'U') IS  NULL 
BEGIN

	CREATE TABLE [dbo].[_MostRecentMADPieces](
		[FIELD_MAILPIECEID] [int] NOT NULL,
		[MAILPIECE_SEGMENTID] [int] NOT NULL,
		[MatchInfo] [varchar](200) NULL,
		[Longitude] [decimal](9, 6) NOT NULL,
		[Latitude] [decimal](9, 6) NOT NULL,
		[KNOWLEDGE_LINK_NUMBER] [varchar](50) NULL
	);

	CREATE NONCLUSTERED INDEX IX_MailPieceSegmentID
		ON [dbo].[_MostRecentMADPieces] ([MAILPIECE_SEGMENTID])
		INCLUDE ([FIELD_MAILPIECEID],[MatchInfo],[Longitude],[Latitude])
END

-- 2017-03-08 FJL - How many days back we're goiing for past jobs
DECLARE @Offset int = 90;

-- This checks to see if the segments for the most recent two mailings are in the _MostRecentMADPieces table.
IF EXISTS (
	SELECT *
	FROM   
	(
		SELECT 
			DISTINCT(MAILSEGMENT_ID)
		FROM dbo.Jobs m
		INNER JOIN job.Jobs j
			ON j.JOB_ID = m.JOB_JOBID
		INNER JOIN MailSegments ms
			ON m.JOB_ID = ms.MAILSEGMENT_JOBID
		INNER JOIN MailPieces mp
			ON ms.MAILSEGMENT_ID = mp.MAILPIECE_SEGMENTID
		WHERE j.JOB_CLIENTID = 461 AND ms.MAILSEGMENT_DROPDATE >= DATEADD(d, -1 * @Offset, GETDATE())
	) B
	WHERE  NOT EXISTS (SELECT 1 
        FROM   _MostRecentMADPieces A 
        WHERE  B.MAILSEGMENT_ID = A.MAILPIECE_SEGMENTID)
) 
BEGIN
-- Blow out all of the records, otherwise create the table
	TRUNCATE TABLE dbo._MostRecentMADPieces; 

	SET NOCOUNT ON;

	INSERT INTO _MostRecentMADPieces (FIELD_MAILPIECEID, MAILPIECE_SEGMENTID, [MatchInfo], Longitude, Latitude, [KNOWLEDGE_LINK_NUMBER])
		SELECT MAILPIECE_ID, MAILPIECE_SEGMENTID, [MatchInfo], CONVERT(float, Longitude) AS Longtitude, CONVERT(float, Latitude) AS Latitude, CONVERT(varchar(20), [KNOWLEDGE_LINK_NUMBER]) AS [KNOWLEDGE_LINK_NUMBER]
		FROM
		(
			SELECT			
				MAILPIECE_ID, 
				CONCAT(MAILPIECE_FIRSTNAME,MAILPIECE_LASTNAME,MAILPIECE_ADDRESS1, MAILPIECE_CITY, MAILPIECE_STATE, MAILPIECE_ZIPCODE) AS [MatchInfo], 
				MAILPIECE_SEGMENTID	,
				FIELD_VALUE,
				FIELD_NAME					
			FROM dbo.Jobs m
			INNER JOIN job.Jobs j
				ON j.JOB_ID = m.JOB_JOBID
			INNER JOIN MailSegments ms
				ON m.JOB_ID = ms.MAILSEGMENT_JOBID
			INNER JOIN MailPieces mp
				ON ms.MAILSEGMENT_ID = mp.MAILPIECE_SEGMENTID
			INNER JOIN  MailPieceFields mpf
				ON mp.MAILPIECE_ID = mpf.FIELD_MAILPIECEID
			WHERE j.JOB_CLIENTID = 461 AND ms.MAILSEGMENT_DROPDATE >= DATEADD(d, -1 * @Offset, GETDATE())
		) AS SourceTable
		PIVOT
		(
			MAX(FIELD_VALUE)
			FOR FIELD_NAME IN ([Longitude], [Latitude], [KNOWLEDGE_LINK_NUMBER])
		) m
		WHERE Latitude IS NOT NULL AND Longitude IS NOT NULL;	 

END
GO