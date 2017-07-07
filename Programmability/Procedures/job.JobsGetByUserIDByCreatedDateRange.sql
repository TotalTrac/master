SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[JobsGetByUserIDByCreatedDateRange]
	@ID		int
	, @From	datetime = NULL
	, @To	datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
DECLARE @CLIENT_ID int;
DECLARE @CLIENT_TYPE INT;
	SELECT @CLIENT_ID = USER_CLIENT_ID FROM dbo.Users WHERE USER_USERID = @Id;
  SELECT @CLIENT_TYPE = CLIENT_TYPE FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;
    
IF @CLIENT_TYPE = 16 OR @CLIENT_TYPE IS NULL
  BEGIN

	DECLARE @IS_VENDOR int;
	SELECT @IS_VENDOR = CLIENT_VENDOR FROM dbo.Clients WHERE CLIENT_ID = @CLIENT_ID;

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
    , j.JOB_COMMENTTHREADID
		, JOB_ROWVERSION
	FROM
		[job].[Jobs] AS j
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
		INNER JOIN [dbo].Relationships AS r
			ON r.RELATIONSHIP_USERID = @ID
				AND r.RELATIONSHIP_CLIENTID = j.JOB_CLIENTID
	WHERE
		(@IS_VENDOR = 0 OR (
			u.USER_CLIENT_ID = @CLIENT_ID
			OR j.JOB_CLIENTID = @CLIENT_ID
		))
		AND (@From IS NULL OR @From <= JOB_CREATED)
		-- 2015-08-06 FJL - This was commented out for some reason
		AND (@To IS NULL OR @To >= JOB_CREATED);
END
ELSE
  BEGIN
	
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
    , j.JOB_COMMENTTHREADID
		, JOB_ROWVERSION
	FROM
		[job].[Jobs] AS j
		INNER JOIN [dbo].[Users] AS u
			ON j.JOB_CREATEDBYID = u.USER_USERID
  

	WHERE
		(j.JOB_CLIENTID = @CLIENT_ID OR u.USER_CLIENT_ID = @CLIENT_ID)

--		AND (@From IS NULL OR @From <= JOB_CREATED)
		-- 2015-08-06 FJL - This was commented out for some reason
--		AND (@To IS NULL OR @To >= JOB_CREATED);
  --WITH CTE 
	--(
	--	CLIENT_ID
	--)
	--AS
	--(
	--	(SELECT c.CLIENT_ID
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Relationships] AS r
	--			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	--	WHERE 
	--		c.CLIENT_PARENTID IS NULL
	--		AND r.RELATIONSHIP_USERID = @ID

	--		UNION
		
	--	SELECT 
	--		c.CLIENT_ID
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Users] AS u
	--			ON c.CLIENT_ID = u.USER_CLIENT_ID
	--	WHERE 
	--		u.USER_USERID = @ID
	--	)
			
	--	UNION ALL

	--	SELECT 
	--		c.CLIENT_ID
	--	FROM [dbo].[Clients] AS c
	--		INNER JOIN [dbo].[Relationships] AS r
	--			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
	--		INNER JOIN CTE
	--			ON CTE.CLIENT_ID = c.CLIENT_PARENTID
	--	WHERE 
	--		c.CLIENT_PARENTID IS NOT NULL
	--		AND r.RELATIONSHIP_USERID = @ID
	--)
 --   SELECT
	--	JOB_ID
	--	, JOB_ACCESSIBILITYLEVEL
	--	, JOB_CLIENTID
	--	, JOB_CREATED
	--	, JOB_CREATEDBYID
	--	, JOB_DESCRIPTION
 --     , JOB_INSTRUCTIONS
 --     , JOB_PASTJOBID
	--	, JOB_NAME		
	--	, JOB_ROWVERSION
	--FROM
	--	[job].[Jobs] AS j
	--	INNER JOIN CTE
	--		ON j.JOB_CLIENTID = CTE.CLIENT_ID
	--WHERE
	--	(@From IS NULL OR @From <= JOB_CREATED)
	--	-- 2015-08-06 FJL - This was commented out for some reason
	--	AND (@To IS NULL OR @To >= JOB_CREATED)		
	--ORDER BY
	--	JOB_ID;
  END
END
GO