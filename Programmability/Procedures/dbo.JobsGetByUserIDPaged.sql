﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetByUserIDPaged] 
	@ID int,
	@Page int,
	@RowsPerPage int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT 
		JOB_ID
		, JOB_ACCESSIBILITYLEVEL
    , JOB_COMMENTTHREADID
		, JOB_COMMINGLERJOBID		
		, JOB_CONTACT
		, JOB_CREATED
		, JOB_CREATEDBYID		
		, JOB_DATADUE
		, JOB_DROPDATE			
		, JOB_ESTIMATEDQUANTITY
		, JOB_MATERIALDUE
		, JOB_NAME
		, JOB_NOTES
		, JOB_JOBID
, JOB_LETTERSHOPID
		, JOB_PONUMBER
		, JOB_PRIORITYID
		, JOB_REFERENCE
		, JOB_SHORTNAME
		, JOB_ROWVERSION  
	FROM 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY m.JOB_ID DESC) AS ResultNum 
			, m.JOB_ID
			, m.JOB_ACCESSIBILITYLEVEL
			, m.JOB_COMMINGLERJOBID
      , m.JOB_COMMENTTHREADID
			, m.JOB_CONTACT
			, m.JOB_CREATED
			, m.JOB_CREATEDBYID			
			, m.JOB_DATADUE
			, m.JOB_DROPDATE			
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
			INNER JOIN [dbo].[Clients] AS c
				ON j.JOB_CLIENTID = c.CLIENT_ID
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			r.RELATIONSHIP_USERID = @ID
	) AS NumberResults
	WHERE 
		ResultNum BETWEEN @StartRow AND @EndRow;

END
GO