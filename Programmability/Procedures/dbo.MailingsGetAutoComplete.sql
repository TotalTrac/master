SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailingsGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
	, @MaxItems		int = 100
AS
BEGIN
			
	SET NOCOUNT ON;
	    
	SELECT TOP (@MaxItems)
		m.JOB_ID
		, m.JOB_ACCESSIBILITYLEVEL
		, m.JOB_CAMPAIGNID
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
		, m.JOB_PONUMBER
		, m.JOB_PRIORITYID
		, m.JOB_REFERENCE
		, m.JOB_SHORTNAME
		, m.JOB_ROWVERSION 
	FROM 
		[dbo].[Jobs] As m
		INNER JOIN [job].Jobs AS j
			ON m.JOB_JOBID = j.JOB_ID		
		INNER JOIN [dbo].[Clients] AS c
			ON j.JOB_CLIENTID = c.CLIENT_ID
		INNER JOIN [dbo].[Relationships] AS r
			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
				AND r.RELATIONSHIP_USERID = @ID
	WHERE
		m.JOB_NAME LIKE '%' + @Substring + '%'
		OR j.JOB_NAME LIKE '%' + @Substring + '%'
		OR CONVERT(char, j.JOB_ID) LIKE '%' + @Substring + '%'
		OR CLIENT_NAME LIKE '%' + @Substring + '%'
		OR CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
	ORDER BY
		COALESCE(( 
			SELECT
				MIN(s.MAILSEGMENT_DROPDATE)
			FROM
				[dbo].[MailSegments] AS s
			WHERE
				s.MAILSEGMENT_JOBID = m.JOB_ID
		), m.JOB_DROPDATE) DESC ;
END
GO