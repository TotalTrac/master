SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetByUserIDByMailDateRangePaged]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
	, @Page int
	, @RowsPerPage int
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @StartRow int;
	DECLARE	@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	DECLARE @CLIENT_ID int;
	SELECT @CLIENT_ID = USER_CLIENT_ID FROM dbo.Users WHERE USER_USERID = @ID;

	DECLARE @IS_VENDOR int;
	SELECT @IS_VENDOR = CLIENT_VENDOR FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;

	SELECT
		*
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY m.JOB_DROPDATE DESC) AS ResultNum
			, m.JOB_ID
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
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO