SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobsFind]	
	@ClientIDs		varchar(4000) = NULL
	, @JobIDs		varchar(4000) = NULL
	, @CampaignType	int = 7
	, @Name			nvarchar(200) = NULL
	, @From			datetime = NULL	
	, @To			datetime = NULL
	, @UserID		int
	, @PageNumber	int = 1
	, @PageSize		int = 100
	
AS
BEGIN
    SET NOCOUNT ON;

	-- CAMPAIGN TYPE
		-- 1 = Direct Mail
		-- 2 = Email Campaign
		-- 4 = Web Campaign

	DECLARE @MAIL_CAMPAIGN int  = 1;
	DECLARE @EMAIL_CAMPAIGN int  = 2;
	DECLARE @WEB_CAMPAIGN int  = 4;

	-- DEFAULT TO ALL CAMPAIGN TYPES IF NONE SPECIFIED OR NULL
	SELECT @CampaignType = COALESCE(@CampaignType, 7);
		
    SELECT DISTINCT
	   j.JOB_ID
	   , j.JOB_ACCESSIBILITYLEVEL
	   , j.JOB_CLIENTID
	   , j.JOB_COMMENTTHREADID
	   , j.JOB_CREATED
	   , j.JOB_CREATEDBYID
	   , j.JOB_DESCRIPTION
	   , j.JOB_INSTRUCTIONS
	   , j.JOB_PASTJOBID
	   , j.JOB_NAME		
	   , j.JOB_ROWVERSION
    FROM
	   [job].[Jobs] AS j
	   LEFT JOIN [dbo].[Jobs] AS m
		  ON j.JOB_ID = m.JOB_JOBID 
	   LEFT JOIN [dbo].[MailSegments] AS s
		  ON m.JOB_ID = s.MAILSEGMENT_JOBID
	   LEFT JOIN [email].[Versions] AS ev
		  ON j.JOB_ID = ev.JobID
	   LEFT JOIN [web].[Versions] AS wv
		  ON j.JOB_ID = wv.JobID
	   INNER JOIN [dbo].[Relationships] AS r
		  ON r.RELATIONSHIP_USERID = @UserID
    WHERE
		-- SEACRH BY CAMPAIGN TYPE	
		((((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND m.JOB_ID IS NOT NULL)
		OR (((@CampaignType & @EMAIL_CAMPAIGN) = @EMAIL_CAMPAIGN) AND ev.[Id] IS NOT NULL)
		OR (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND wv.[Id] IS NOT NULL))

		-- SEARCH CLIENT IDs
		AND (@ClientIDs IS NULL OR @ClientIDs = '' OR j.JOB_ID IN (
			SELECT
			j.JOB_ID
			FROM 
			[job].[Jobs] AS j
			INNER JOIN IntegerListToTable(@ClientIDs) AS i 
			ON j.JOB_CLIENTID = i.number
		))

		-- SEARCH JOB NUMBERS
		AND (@JobIDs IS NULL OR @JobIDs = '' OR j.JOB_ID IN (
			SELECT
			j.JOB_ID
			FROM 
			[job].[Jobs] AS j
			INNER JOIN IntegerListToTable(@JobIDs) AS i 
			ON j.JOB_ID = i.number
		))

		-- SEARCH BY NAME
		AND (
			@Name IS NULL OR @Name = '' 
			OR j.JOB_NAME LIKE '%' + @Name + '%' 
			OR (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND m.JOB_NAME LIKE '%' + @Name + '%' )
			OR (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND MAILSEGMENT_NAME LIKE '%' + @Name + '%')
			OR (((@CampaignType & @EMAIL_CAMPAIGN) = @EMAIL_CAMPAIGN) AND ev.[Name] LIKE '%' + @Name + '%')
			OR (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND wv.[Name] LIKE '%' + @Name + '%')
		)

		-- SEARCH BY DATE RANGE
		AND 
		(
			(@From IS NULL AND @To IS NULL)

			-- SEARCH JOB CREATED DATE
			OR m.JOB_ID IS NULL AND ev.Id IS NULL and wv.Id IS NULL AND
			(
				(j.JOB_CREATED >= @From AND @To IS NULL)
				OR (@From IS NULL AND j.JOB_CREATED <= @To)
				OR (j.JOB_CREATED >= @From AND j.JOB_CREATED <= @To)
			)

			-- SEARCH MAILING DROP DATE -- IF NO SEGMENTS
			OR s.MAILSEGMENT_ID IS NULL AND (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND 
			(
				(m.JOB_DROPDATE >= @From AND @To IS NULL)
				OR (@From IS NULL AND m.JOB_DROPDATE <= @To)
				OR (m.JOB_DROPDATE >= @From AND m.JOB_DROPDATE <= @To)
			))

			-- SEARCH SEGMENT DROP DATE
			OR s.MAILSEGMENT_ID IS NOT NULL AND (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND 
			(
				(s.MAILSEGMENT_DROPDATE >= @From AND @To IS NULL)
				OR (@From IS NULL AND s.MAILSEGMENT_DROPDATE <= @To)
				OR (s.MAILSEGMENT_DROPDATE >= @From AND s.MAILSEGMENT_DROPDATE <= @To)
			))

			-- SEARCH WEB CAMPAIGN ACTIVE DATE RANGE
			OR wv.[Id] IS NOT NULL AND (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND 
			(	((@From IS NULL OR wv.[ActiveEnd] IS NULL) AND wv.[ActiveBegin] <= @To)
				OR ((@To IS NULL OR wv.[ActiveBegin] IS NULL) AND wv.[ActiveEnd] >= @From)
				OR (wv.[ActiveBegin] <= @To AND wv.[ActiveEnd] >= @From)
			))  
		) 
		ORDER BY j.JOB_ID
		OFFSET @PageSize * (@PageNumber - 1) ROWS
		FETCH NEXT @PageSize ROWS ONLY;

	SELECT 
		COUNT(DISTINCT j.JOB_ID) AS [TotalCount]	   
    FROM
	   [job].[Jobs] AS j
	   LEFT JOIN [dbo].[Jobs] AS m
		  ON j.JOB_ID = m.JOB_JOBID 
	   LEFT JOIN [dbo].[MailSegments] AS s
		  ON m.JOB_ID = s.MAILSEGMENT_JOBID
	   LEFT JOIN [email].[Versions] AS ev
		  ON j.JOB_ID = ev.JobID
	   LEFT JOIN [web].[Versions] AS wv
		  ON j.JOB_ID = wv.JobID
	   INNER JOIN [dbo].[Relationships] AS r
		  ON r.RELATIONSHIP_USERID = @UserID
    WHERE
		-- SEACRH BY CAMPAIGN TYPE	
		((((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND m.JOB_ID IS NOT NULL)
		OR (((@CampaignType & @EMAIL_CAMPAIGN) = @EMAIL_CAMPAIGN) AND ev.[Id] IS NOT NULL)
		OR (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND wv.[Id] IS NOT NULL))

		-- SEARCH CLIENT IDs
		AND (@ClientIDs IS NULL OR @ClientIDs = '' OR j.JOB_ID IN (
			SELECT
			j.JOB_ID
			FROM 
			[job].[Jobs] AS j
			INNER JOIN IntegerListToTable(@ClientIDs) AS i 
			ON j.JOB_CLIENTID = i.number
		))

		-- SEARCH JOB NUMBERS
		AND (@JobIDs IS NULL OR @JobIDs = '' OR j.JOB_ID IN (
			SELECT
			j.JOB_ID
			FROM 
			[job].[Jobs] AS j
			INNER JOIN IntegerListToTable(@JobIDs) AS i 
			ON j.JOB_ID = i.number
		))

		-- SEARCH BY NAME
		AND (
			@Name IS NULL OR @Name = '' 
			OR j.JOB_NAME LIKE '%' + @Name + '%' 
			OR (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND m.JOB_NAME LIKE '%' + @Name + '%' )
			OR (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND MAILSEGMENT_NAME LIKE '%' + @Name + '%')
			OR (((@CampaignType & @EMAIL_CAMPAIGN) = @EMAIL_CAMPAIGN) AND ev.[Name] LIKE '%' + @Name + '%')
			OR (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND wv.[Name] LIKE '%' + @Name + '%')
		)

		-- SEARCH BY DATE RANGE
		AND 
		(
			(@From IS NULL AND @To IS NULL)

			-- SEARCH JOB CREATED DATE
			OR m.JOB_ID IS NULL AND ev.Id IS NULL and wv.Id IS NULL AND
			(
				(j.JOB_CREATED >= @From AND @To IS NULL)
				OR (@From IS NULL AND j.JOB_CREATED <= @To)
				OR (j.JOB_CREATED >= @From AND j.JOB_CREATED <= @To)
			)

			-- SEARCH MAILING DROP DATE -- IF NO SEGMENTS
			OR s.MAILSEGMENT_ID IS NULL AND (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND 
			(
				(m.JOB_DROPDATE >= @From AND @To IS NULL)
				OR (@From IS NULL AND m.JOB_DROPDATE <= @To)
				OR (m.JOB_DROPDATE >= @From AND m.JOB_DROPDATE <= @To)
			))

			-- SEARCH SEGMENT DROP DATE
			OR s.MAILSEGMENT_ID IS NOT NULL AND (((@CampaignType & @MAIL_CAMPAIGN) = @MAIL_CAMPAIGN) AND 
			(
				(s.MAILSEGMENT_DROPDATE >= @From AND @To IS NULL)
				OR (@From IS NULL AND s.MAILSEGMENT_DROPDATE <= @To)
				OR (s.MAILSEGMENT_DROPDATE >= @From AND s.MAILSEGMENT_DROPDATE <= @To)
			))

			-- SEARCH WEB CAMPAIGN ACTIVE DATE RANGE
			OR wv.[Id] IS NOT NULL AND (((@CampaignType & @WEB_CAMPAIGN) = @WEB_CAMPAIGN) AND 
			(	((@From IS NULL OR wv.[ActiveEnd] IS NULL) AND wv.[ActiveBegin] <= @To)
				OR ((@To IS NULL OR wv.[ActiveBegin] IS NULL) AND wv.[ActiveEnd] >= @From)
				OR (wv.[ActiveBegin] <= @To AND wv.[ActiveEnd] >= @From)
			))  
		);
END
GO