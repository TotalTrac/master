﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobGetByID]
	@ID Int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		m.JOB_ID
		, m.JOB_ACCESSIBILITYLEVEL
		, m.JOB_CAMPAIGNID
    , JOB_COMMENTTHREADID
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
	FROM 
		[dbo].[Jobs] AS m		
	WHERE 
		m.JOB_ID = @ID;
END
GO