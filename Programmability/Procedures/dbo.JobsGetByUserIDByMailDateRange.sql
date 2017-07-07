﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetByUserIDByMailDateRange]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
DECLARE @CLIENT_ID int;
DECLARE @CLIENT_TYPE INT;
	SELECT @CLIENT_ID = USER_CLIENT_ID FROM dbo.Users WHERE USER_USERID = @Id;
  SELECT @CLIENT_TYPE = CLIENT_TYPE FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;
    
IF @CLIENT_TYPE != 16 AND @CLIENT_TYPE IS NOT NULL
  BEGIN
	
SELECT DISTINCT
     m.JOB_ID
		, m.JOB_ACCESSIBILITYLEVEL
  , m.JOB_COMMENTTHREADID
		, m.JOB_COMMINGLERJOBID
		, m.JOB_CAMPAIGNID		
  , creator.USER_CLIENT_ID 
,j.JOB_CLIENTID
  , m.JOB_LETTERSHOPID 
		, m.JOB_CONTACT
		, m.JOB_CREATED
		, m.JOB_CREATEDBYID		
		, m.JOB_DATADUE
		, COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) AS JOB_DROPDATE
		, m.JOB_ESTIMATEDQUANTITY		
		, m.JOB_MATERIALDUE
		, m.JOB_NAME
		, m.JOB_NOTES
		, m.JOB_JOBID
    , m.JOB_LETTERSHOPID
		, m.JOB_PONUMBER
		, m.JOB_PRIORITYID
		, m.JOB_REFERENCE
		, m.JOB_SHORTNAME
		, m.JOB_ROWVERSION  
	FROM 
		[dbo].[Jobs] AS m
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
  INNER JOIN dbo.Users creator ON m.JOB_CREATEDBYID = creator.USER_USERID
    

WHERE (
  (j.JOB_CLIENTID = @CLIENT_ID OR creator.USER_CLIENT_ID = @CLIENT_ID)
      OR m.JOB_LETTERSHOPID = @CLIENT_ID) AND (@From IS NULL OR COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) >= @From)
		AND (@To IS NULL OR COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) <= @To)
  END
  ELSE
  BEGIN


	DECLARE @IS_VENDOR int;
	SELECT @IS_VENDOR = CLIENT_VENDOR FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;

	SELECT 
		m.JOB_ID
		, m.JOB_ACCESSIBILITYLEVEL
    , m.JOB_COMMENTTHREADID
		, m.JOB_COMMINGLERJOBID
		, m.JOB_CAMPAIGNID		
		, m.JOB_CONTACT
		, m.JOB_CREATED
		, m.JOB_CREATEDBYID		
		, m.JOB_DATADUE
		, COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) AS JOB_DROPDATE
		, m.JOB_ESTIMATEDQUANTITY		
		, m.JOB_MATERIALDUE
		, m.JOB_NAME
		, m.JOB_NOTES
		, m.JOB_JOBID
    , m.JOB_LETTERSHOPID
		, m.JOB_PONUMBER
		, m.JOB_PRIORITYID
		, m.JOB_REFERENCE
		, m.JOB_SHORTNAME
		, m.JOB_ROWVERSION  
	FROM 
		[dbo].[Jobs] AS m
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
		INNER JOIN [dbo].Relationships AS r
			ON r.RELATIONSHIP_USERID = @ID
				AND r.RELATIONSHIP_CLIENTID = j.JOB_CLIENTID
	WHERE
		(@IS_VENDOR = 0 OR (
			u.USER_CLIENT_ID = @CLIENT_ID
			OR j.JOB_CLIENTID = @CLIENT_ID
		))
		AND (@From IS NULL OR COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) >= @From)
		AND (@To IS NULL OR COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) <= @To)
END
  END
GO