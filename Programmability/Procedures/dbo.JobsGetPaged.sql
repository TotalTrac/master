SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetPaged] 
	@Page			int
	, @RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT 
		* 
	FROM 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY JOB_ID DESC) AS ResultNum 
			, JOB_ID
			, JOB_ACCESSIBILITYLEVEL
			, JOB_CAMPAIGNID
      , JOB_COMMENTTHREADID
			, JOB_COMMINGLERJOBID			
			, JOB_CONTACT
			, JOB_CREATED
			, JOB_CREATEDBYID			
			, JOB_DATADUE
			, COALESCE(( 
				SELECT
					MIN(s.MAILSEGMENT_DROPDATE)
				FROM
					[dbo].[MailSegments] AS s
				WHERE
					s.MAILSEGMENT_JOBID = JOB_ID
			), JOB_DROPDATE) AS JOB_DROPDATE
			, JOB_ESTIMATEDQUANTITY
      , JOB_LETTERSHOPID
			, JOB_MATERIALDUE
			, JOB_PONUMBER
			, JOB_NAME
			, JOB_NOTES
			, JOB_JOBID
			, JOB_PRIORITYID
			, JOB_REFERENCE
			, JOB_SHORTNAME
			, JOB_ROWVERSION  
		FROM
			[dbo].[Jobs]
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO