SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[job_JobAutocompleteGet]
	@ID				int
	, @Substring	nvarchar(255)
	, @MaxItems		int	 = 100
AS
BEGIN
			
	SET NOCOUNT ON;

	DECLARE @CLIENT_ID int;
	SELECT @CLIENT_ID = USER_CLIENT_ID FROM dbo.Users WHERE USER_USERID = @ID;

	DECLARE @IS_VENDOR int;
	SELECT @IS_VENDOR = CLIENT_VENDOR FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;

	SELECT TOP (@MaxItems)
		CLIENT_NAME					AS [ClientName]
		, CLIENT_SHORTNAME			AS [ClientShortName]
		, JOB_ID					AS [Id]
		, JOB_CLIENTID					AS [ClientId]
    , c.CLIENT_PARENTID AS [ClientParentID]
		--, JOB_ACCESSIBILITYLEVEL
		--, JOB_CLIENTID
		--, JOB_CREATED 
		--, JOB_CREATEDBYID
		--, JOB_DESCRIPTION
		, JOB_NAME					AS [Name]
		--, JOB_ROWVERSION
	FROM
		[job].[Jobs] AS j
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
		INNER JOIN [dbo].Relationships AS r
			ON r.RELATIONSHIP_USERID = @ID
				AND r.RELATIONSHIP_CLIENTID = j.JOB_CLIENTID
		INNER JOIN [dbo].[Clients] AS c
			ON r.RELATIONSHIP_CLIENTID = c.CLIENT_ID
	WHERE
		(@IS_VENDOR = 0 OR (
			u.USER_CLIENT_ID = @CLIENT_ID
			OR j.JOB_CLIENTID = @CLIENT_ID
		))
		AND 
		(
			j.JOB_NAME LIKE '%' + @Substring + '%'
			OR CONVERT(char, j.JOB_ID) LIKE '%' + @Substring + '%'
			OR CLIENT_NAME LIKE '%' + @Substring + '%'
			OR CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
		)
	ORDER BY JOB_ID DESC;

 --   WITH CTE (CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME)
	--AS
	--(
	--	(SELECT c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Relationships] AS r
	--			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	--	WHERE 
	--		c.CLIENT_PARENTID IS NULL
	--		AND r.RELATIONSHIP_USERID = @ID

	--		UNION
		
	--	SELECT 
	--		c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Users] AS u
	--			ON c.CLIENT_ID = u.USER_CLIENT_ID
	--	WHERE 
	--		u.USER_USERID = @ID
	--	)
			
	--	UNION ALL

	--	SELECT 
	--		c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Relationships] AS r
	--			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	--		INNER JOIN CTE
	--			ON CTE.CLIENT_ID = c.CLIENT_PARENTID
	--	WHERE 
	--		c.CLIENT_PARENTID IS NOT NULL
	--		AND r.RELATIONSHIP_USERID = @ID
	--)	
	--SELECT TOP (@MaxItems)
	--	CLIENT_NAME					AS [ClientName]
	--	, CLIENT_SHORTNAME			AS [ClientShortName]
	--	, JOB_ID					AS [Id]
	--	--, JOB_ACCESSIBILITYLEVEL
	--	--, JOB_CLIENTID
	--	--, JOB_CREATED
	--	--, JOB_CREATEDBYID
	--	--, JOB_DESCRIPTION
	--	, JOB_NAME					AS [Name]
	--	--, JOB_ROWVERSION
	--FROM
	--	[job].Jobs AS j
	--	INNER JOIN CTE
	--		ON CTE.CLIENT_ID = j.JOB_CLIENTID
	--WHERE
	--	j.JOB_NAME LIKE '%' + @Substring + '%'
	--	OR CONVERT(char, j.JOB_ID) LIKE '%' + @Substring + '%'
	--	OR CLIENT_NAME LIKE '%' + @Substring + '%'
	--	OR CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
	--ORDER BY JOB_ID DESC;
END
GO