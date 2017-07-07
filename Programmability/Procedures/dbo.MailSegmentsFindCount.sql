SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentsFindCount]	
	@ClientIDs		varchar(100) = NULL
	, @DropDate		datetime = NULL	
	, @JobIDs		varchar(100) = NULL
	, @Name			nvarchar(50) = NULL
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		COUNT(MAILSEGMENT_ID)		
	FROM 
		[dbo].[MailSegments]
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
		AND (@Name IS NULL OR @Name = '' OR MAILSEGMENT_NAME LIKE '%' + @Name + '%');
END
GO