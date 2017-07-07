SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StJohns_GetByIndividualIdByGroupId] 
	@IndividualId nvarchar(25),
	@GroupId nvarchar(25)
AS
BEGIN
	declare @searchdate datetime;
	declare @now datetime;
	set @now = getdate();
	set @searchdate = dateadd(day,-365,@now);

	WITH CTE_M3Jobs AS
	(
		SELECT ms.MAILSEGMENT_ID
		FROM job.Jobs j
		INNER JOIN dbo.Jobs m
			ON m.JOB_JOBID = j.JOB_ID
		INNER JOIN dbo.MailSegments ms
			ON ms.MAILSEGMENT_JOBID = m.JOB_ID
		WHERE j.JOB_CLIENTID = 268
	)
	SELECT 
	   [MAILPIECE_ID]
      --,[MAILPIECE_ADDRESS1]
      --,[MAILPIECE_ADDRESS2]
      --,[MAILPIECE_ADDRESS3]
      --,[MAILPIECE_CITY]
      --,[MAILPIECE_COMPANY]
      --,[MAILPIECE_FIRSTNAME]
      --,[MAILPIECE_GROUPID]
      --,[MAILPIECE_INDIVIDUALID]
      --,[MAILPIECE_LASTNAME]
      --,[MAILPIECE_SEGMENTID]
      --,[MAILPIECE_ROUTINGCODE]
      --,[MAILPIECE_SCFID]
      --,[MAILPIECE_STATE]
      --,[MAILPIECE_TITLE]
      --,[MAILPIECE_TRACKINGCODE]
      --,[MAILPIECE_ZIPCODE]
      --,[MAILPIECE_ZIPCODEEXT]
      --,[MAILPIECE_CRRT]
      --,[MAILPIECE_FINALIZESCANID]
      --,[MAILPIECE_FORWARDSCANID]
      --,[MAILPIECE_RETURNSCANID]
      --,[MAILPIECE_FIRSTSCANID]
      --,[MAILPIECE_LASTSCANID]
      --,[MAILPIECE_TARGETID]
      --,[MAILPIECE_DELIVERYDATE]
	FROM dbo.MailPieces mp
	INNER JOIN CTE_M3Jobs j
		ON mp.MAILPIECE_SEGMENTID = j.MAILSEGMENT_ID
	WHERE MAILPIECE_INDIVIDUALID = @IndividualId	
		AND MAILPIECE_GROUPID = @GroupId
	ORDER BY MAILPIECE_ID DESC

END
GO