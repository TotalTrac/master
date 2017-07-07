SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[_DO_NOT_DELETE_JobsGetByUserID_BY_ACCESSIBILTY_LEVEL] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT 
		m.JOB_ID
		, m.JOB_ACCESSIBILITYLEVEL
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
		, m.JOB_PONUMBER
		, m.JOB_PRIORITYID
		, m.JOB_REFERENCE
		, m.JOB_SHORTNAME
		, m.JOB_ROWVERSION  
	FROM 
		[dbo].[Jobs] AS m
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
		-- Join to the users table on the job created by user id
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
		-- Join to the users table on the logged in user id
		INNER JOIN [dbo].[Users] AS u2
			ON u2.USER_USERID = @ID
		-- Join to the clients table on the logged in user id
		INNER JOIN [dbo].[Clients] AS c
			ON u2.USER_CLIENT_ID = c.CLIENT_ID
		--  Join to the relationships table on the logged in user id
		LEFT JOIN [dbo].Relationships AS r
			ON r.RELATIONSHIP_USERID = @ID
				AND r.RELATIONSHIP_CLIENTID = j.JOB_CLIENTID
	WHERE
		-- IS A VENDOR
		(c.CLIENT_VENDOR = 1 
			AND (
				-- User works for a vendor. Only select jobs created by this user 
				-- or jobs that were created by users at the same vendor
				(u.USER_CLIENT_ID = c.CLIENT_ID)
				AND (
					CASE 
						-- PUBLIC - Visible to everyone
						WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483648 THEN 1 
						
						-- ////////////////////////////////////////////////////////////////////////////
						-- VENDORS WILL NEVER BE INTERNAL
						-- INTERNAL - Only internal (e.g. FMI) users can see
						-- WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483647 AND c.CLIENT_INTERNAL = 1 THEN 1 
						--/////////////////////////////////////////////////////////////////////////////

						-- PROTECTED - User must have a relationship
						WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483646 AND r.RELATIONSHIP_ID IS NOT NULL THEN 1
						-- PRIVATE - Only user who created the job can see it
						WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483645 AND m.JOB_CREATEDBYID = @ID THEN 1
					END
				) = 1
			)
		)
		OR -- IS NOT A VENDOR
		(c.CLIENT_VENDOR = 0 
			AND (
				CASE 
					-- PUBLIC - Visible to everyone
					WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483648 THEN 1 
					-- INTERNAL - Only internal (e.g. FMI) users can see
					WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483647 AND c.CLIENT_INTERNAL = 1 THEN 1 
					-- PROTECTED - User must have a relationship
					WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483646 AND r.RELATIONSHIP_ID IS NOT NULL THEN 1
					-- PRIVATE - Only user who created the job can see it
					WHEN m.JOB_ACCESSIBILITYLEVEL = -2147483645 AND m.JOB_CREATEDBYID = @ID THEN 1
				END
			) = 1
		);
END
GO