SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetByClientIDsPaged]
	@IDs			varchar(100),
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY m.JOB_ID DESC) AS ResultNum 
			, m.JOB_ID
			, m.JOB_ACCESSIBILITYLEVEL
			, m.JOB_CAMPAIGNID
      , m.JOB_COMMENTTHREADID
			, m.JOB_COMMINGLERJOBID			
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
		FROM [dbo].[Jobs] AS m
		WHERE m.JOB_ID IN (
			SELECT
				m.JOB_ID
			FROM 
				[dbo].[Jobs] AS m
				INNER JOIN [job].[Jobs] AS j
					ON m.JOB_JOBID = j.JOB_ID
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON j.JOB_CLIENTID = i.number
			))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO