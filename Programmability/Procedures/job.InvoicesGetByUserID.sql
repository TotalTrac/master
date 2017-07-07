SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InvoicesGetByUserID]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
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
			AND r.RELATIONSHIP_USERID = @ID
	)
	SELECT
		ID
		, CREATED
		, CreatedById
		, JOBID
    , Note
    , [State]
		, UPDATED
		, [ROWVERSION]
	FROM
		[job].[Invoices] as i
		INNER JOIN [job].Jobs as j
			ON j.JOB_ID = i.JOBID
		INNER JOIN CTE
			ON j.JOB_CLIENTID = CTE.CLIENT_ID
	WHERE		
		(@From IS NULL OR CREATED >= @From)
		AND (@To IS NULL OR CREATED <= @To);
END
GO