﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGet]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		JOB_ID
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
		[dbo].[Jobs]
	ORDER BY
		JOB_ID;
END
GO