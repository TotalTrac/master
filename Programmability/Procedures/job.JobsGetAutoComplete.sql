﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobsGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;

    WITH CTE (CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME)
	AS
	(
		(SELECT c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
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
		JOB_ID
		, JOB_ACCESSIBILITYLEVEL
		, JOB_CLIENTID
		, JOB_CREATED
		, JOB_CREATEDBYID
		, JOB_DESCRIPTION
    , JOB_INSTRUCTIONS
      , JOB_PASTJOBID
		, JOB_NAME		
		, JOB_ROWVERSION
	FROM
		[job].Jobs AS j
		INNER JOIN CTE
			ON CTE.CLIENT_ID = j.JOB_CLIENTID
	WHERE
		j.JOB_NAME LIKE '%' + @Substring + '%'
		OR CONVERT(char, j.JOB_ID) LIKE '%' + @Substring + '%'
		OR CLIENT_NAME LIKE '%' + @Substring + '%'
		OR CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
	ORDER BY JOB_ID;
END
GO