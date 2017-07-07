SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ClicksGetCount] 
	@FilterBy		int = NULL
	, @ID			int = NULL
	, @FilterBy2	int = NULL
	, @ID2			sql_variant = NULL	
	, @GroupBy		int = NULL
	, @GroupByDate	bit = 0
	, @From			date = NULL
	, @To			date = NULL
AS
BEGIN
	
	-- @FilterBy
	-- 1 = Client
	-- 2 = Job
	-- 3 = Version
	-- 4 = User
	-- 5 = Address
	-- 6 = Link
	
	-- @GroupBy
	-- 1 = Client
	-- 2 = Job
	-- 3 = Version
	-- 4 = User
	-- 5 = Address
	-- 6 = Link
	
	SET NOCOUNT ON;

	DECLARE @sql nvarchar(MAX);
	
	SELECT @sql = '	
		SELECT ' +
			CASE @GroupBy
				WHEN 1 THEN
					'j.[JOB_CLIENTID]'
				WHEN 2 THEN
					'v.[JobId]'
				WHEN 3 THEN
					'a.[VersionId]'
				WHEN 4 THEN
					'a.[TargetId]'
				WHEN 5 THEN
					'c.[AddressId]'
				WHEN 6 THEN
					'c.[LinkId]'
				ELSE
					'NULL'
			END + ' AS [ID]';

	IF (@From IS NOT NULL OR @To IS NOT NULL) AND @GroupByDate = 1
		SELECT @sql = @sql + ', CONVERT(DATE, c.[DateTime]) AS [Date]';
	
	SELECT @sql = @sql + ', COUNT(*) AS [Count]
						 FROM [email].[Clicks] AS c';

	IF --@FilterBy = 5 OR @FilterBY2 = 5 OR @GroupBy = 5 OR
		@FilterBy = 4 OR @FilterBY2 = 4 OR @GroupBy = 4 OR
		@FilterBy = 3 OR @FilterBY2 = 3 OR @GroupBy = 3 OR
		@FilterBy = 2 OR @FilterBY2 = 2 OR @GroupBy = 2 OR
		@FilterBy = 1 OR @FilterBY2 = 1 OR @GroupBy = 1
		SELECT @sql = ' INNER JOIN [email].[Addresses] AS a
							ON c.[AddressId] = a.[Id]';

	IF --@FilterBy = 4 OR @FilterBY2 = 4 OR @GroupBy = 4 OR
		@FilterBy = 3 OR @FilterBY2 = 3 OR @GroupBy = 3 OR
		@FilterBy = 2 OR @FilterBY2 = 2 OR @GroupBy = 2 OR
		@FilterBy = 1 OR @FilterBY2 = 1 OR @GroupBy = 1
		SELECT @sql = ' INNER JOIN [dbo].[CampaignUsers] AS u
							ON a.[TargetId] = u.[Id]';

	IF --@FilterBy = 3 OR @FilterBY2 = 3 OR @GroupBy = 3 OR
		@FilterBy = 2 OR @FilterBY2 = 2 OR @GroupBy = 2 OR
		@FilterBy = 1 OR @FilterBY2 = 1 OR @GroupBy = 1
		SELECT @sql = ' INNER JOIN [email].[Versions] AS v
							ON a.[VersionId] = v.[Id]';

	IF-- @FilterBy = 2 OR @FilterBY2 = 2 OR @GroupBy = 2 OR
		@FilterBy = 1 OR @FilterBY2 = 1 OR @GroupBy = 1
		SELECT @sql = ' INNER JOIN [job].[Jobs] AS j
							ON v.[JobId] = j.[Id]';

	IF @From IS NOT NULL AND @To IS NOT NULL
		SELECT @sql = @sql + ' WHERE (CONVERT(DATE, c.[DateTime]) BETWEEN ''' + CONVERT(varchar, @From, 121) + ''' AND ''' + CONVERT(varchar, @To, 121) + ''')';
	ELSE IF @From IS NOT NULL
		SELECT @sql = @sql + ' WHERE (CONVERT(DATE, c.[DateTime]) >= ''' + CONVERT(varchar, @From, 121) + ''')';
	ELSE IF @To IS NOT NULL
		SELECT @sql = @sql + ' WHERE (CONVERT(DATE, c.[DateTime]) <= ''' + CONVERT(varchar, @To, 121) + ''')';

	IF @FilterBy IS NOT NULL AND @ID IS NOT NULL
	BEGIN
		SELECT @sql = @sql + ' AND @ID = ' +
			CASE @FilterBy			
				WHEN 1 THEN			
					'CONVERT(varchar, j.[JOB_CLIENTID])'
				WHEN 2 THEN
					'CONVERT(varchar, v.[JobId])'
				WHEN 3 THEN
					'CONVERT(varchar, a.[VersionId])'
				WHEN 4 THEN
					'CONVERT(varchar, a.[TargetId])'
				WHEN 5 THEN
					'CONVERT(varchar, c.[AddressId])'
				WHEN 6 THEN
					'CONVERT(varchar, c.[LinkId])'
				ELSE
					'NULL'
			END

		IF @FilterBy2 IS NOT NULL AND @ID2 IS NOT NULL			
			SELECT @sql = @sql + ' AND @ID2 = '	+ 
				CASE @FilterBy2			
					WHEN 1 THEN			
						'CONVERT(varchar, j.[JOB_CLIENTID])'
					WHEN 2 THEN
						'CONVERT(varchar, v.[JobId])'
					WHEN 3 THEN
						'CONVERT(varchar, a.[VersionId])'
					WHEN 4 THEN
						'CONVERT(varchar, a.[TargetId])'
					WHEN 5 THEN
						'CONVERT(varchar, c.[AddressId])'
					WHEN 6 THEN
						'CONVERT(varchar, c.[LinkId])'
					ELSE
						'NULL'
				END					
	END

	IF @GroupBy IS NOT NULL
		SELECT @sql = @sql + '
		GROUP BY ' +
			CASE @GroupBy
				WHEN 1 THEN
					'j.[JOB_CLIENTID]'
				WHEN 2 THEN
					'v.[JobId]'
				WHEN 3 THEN 
					'a.[VersionId]'
				WHEN 4 THEN
					'a.[TargetId]'		
				WHEN 5 THEN
					'c.[AddressId]'
				WHEN 6 THEN
					'c.[LinkId]'
				ELSE
					'NULL'
			END

	IF (@From IS NOT NULL OR @To IS NOT NULL) AND @GroupByDate = 1
	BEGIN
		IF @GroupBy IS NULL
			SELECT @sql = @sql + ' GROUP BY';
		ELSE
			SELECT @sql = @sql + ',';

		SELECT @sql = @sql + ' CONVERT(DATE, c.[DateTime]) ';
	END
			
	DECLARE @paramlist  nvarchar(4000);

	SELECT @paramlist = '@ID int, @ID2 sql_variant';

	EXEC sp_executesql @sql, @paramlist, @ID, @ID2;	
END
GO