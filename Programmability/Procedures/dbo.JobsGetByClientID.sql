﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetByClientID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(
		SELECT 
			c.CLIENT_ID
		FROM 
			[dbo].[Clients] AS c			
		WHERE 
			c.CLIENT_ID = @ID			
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_CLIENTID = @ID    		
	)
	SELECT 
		m.JOB_ID
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
		, m.JOB_PRIORITYID
		, m.JOB_PONUMBER
		, m.JOB_REFERENCE
		, m.JOB_SHORTNAME
		, m.JOB_ROWVERSION  
	FROM 
		[dbo].[Jobs] AS m
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
		INNER JOIN CTE
			ON j.JOB_CLIENTID = CTE.CLIENT_ID
	ORDER BY
		m.JOB_ID;
END
GO