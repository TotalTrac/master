SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[file_ObjectsGetAutocomplete]
	@ID				int
	, @Substring	nvarchar(255)
	, @MaxItems		int = 100
AS
BEGIN
			
	SET NOCOUNT ON;
	
	WITH CTE_FlatSizes
	AS
	(
		SELECT 
			f.FOLDER_FOLDERID AS [FolderID]
			, f.FOLDER_ID AS [ID]
			, SUM(COALESCE(f2.FILE_SIZE, 0)) AS [Size]
		FROM 
			[file].[Folders] AS f
			LEFT JOIN [file].[Files] AS f2
				ON f.FOLDER_ID = f2.FILE_FOLDERID
			WHERE
				f.FOLDER_USERID = @ID OR f2.FILE_USERID = @ID
			GROUP BY 
				f.FOLDER_FOLDERID
				, f.FOLDER_ID
	),
	CTE_HierarchialSizes 
	AS
	(
		SELECT 
			[ID]
			, [Size]
			, [ID] AS [RootID]
		FROM 
			CTE_FlatSizes

	  UNION ALL

	  SELECT 
			f.ID AS [ID]
			, f.Size AS [Size]
			, c.RootID as [RootID]
		FROM 
			CTE_FlatSizes AS f
			INNER JOIN CTE_HierarchialSizes AS c
				ON f.FolderID = c.[ID]
	),
	CTE_Folders AS
	(
		SELECT TOP (@MaxItems)
			f.FOLDER_ID
			, f.FOLDER_CREATED
			, f.FOLDER_CREATEDBYID
			, f.FOLDER_DESCRIPTION
			, f.FOLDER_FOLDERID
			, f.FOLDER_NAME
			, COALESCE(s.Size, 0) AS [FOLDER_SIZE]
			, f.FOLDER_USERID
			, f.FOLDER_ROWVERSION
		FROM
			[file].[Folders] AS f
			LEFT JOIN [file].[FolderPermissions] AS p
				ON f.FOLDER_ID = p.FOLDERPERMISSION_FOLDERID
					AND p.FOLDERPERMISSION_USERID = @ID
			INNER JOIN 
			(
				SELECT 
					RootID
					, SUM(C.Size) AS [Size]
				FROM 
					CTE_HierarchialSizes AS c
				GROUP BY 
					RootID
			) AS S
				ON f.FOLDER_ID = S.RootID	
		WHERE
			-- owned folders
			f.FOLDER_USERID = @ID
			AND f.[FOLDER_NAME] LIKE '%' + @Substring + '%'
			OR f.[FOLDER_DESCRIPTION] LIKE '%' + @Substring + '%'
		
			-- shared folders
			--OR (p.FOLDERPERMISSION_USERID = @ID AND p.FOLDERPERMISSION_PRIVILEGES > 0 AND (p.FOLDERPERMISSION_FOLDERID = @Filter OR (p.FOLDERPERMISSION_FOLDERID IS NULL AND @Filter IS NULL)));					
		ORDER BY
			f.FOLDER_CREATED DESC
	),
	CTE_Files AS
	(
		SELECT TOP (@MaxItems)
			f.[FILE_ID]
			, f.FILE_COMPRESSED
			, f.FILE_CONTENTTYPEID		
			, f.FILE_DESCRIPTION
			, f.[FILE_NAME]
			, f.FILE_FOLDERID
			, f.FILE_SIZE
			, f.FILE_TYPEID
			, f.FILE_UPLOADED
			, f.FILE_USERID
		FROM
			[file].[Files] AS f
			LEFT JOIN [file].[FilePermissions] AS p
				ON f.[FILE_ID] = p.FILEPERMISSION_METADATAID
					AND p.FILEPERMISSION_USERID = @ID
		WHERE
			-- owned folders
			f.FILE_USERID = @ID
			AND f.[FILE_NAME] LIKE '%' + @Substring + '%'
			OR f.[FILE_DESCRIPTION] LIKE '%' + @Substring + '%'
		
			-- shared folders
			--OR (p.FOLDERPERMISSION_USERID = @ID AND p.FOLDERPERMISSION_PRIVILEGES > 0 AND (p.FOLDERPERMISSION_FOLDERID = @Filter OR (p.FOLDERPERMISSION_FOLDERID IS NULL AND @Filter IS NULL)));					
		ORDER BY
			f.FILE_UPLOADED DESC
	)
	SELECT
		'Folder'				AS [Type]
		, f1.[FOLDER_FOLDERID]		AS [FolderID]
		, f1.[FOLDER_NAME]			AS [FolderName]
		, f1.[FOLDER_ID]			AS [ID]
		, f1.[FOLDER_CREATED]		AS [Created]
		, f1.[FOLDER_CREATEDBYID]	AS [CreatedByID]
		, f1.[FOLDER_DESCRIPTION]	AS [Description]
		, f1.[FOLDER_NAME]			AS [Name]
		, f1.[FOLDER_USERID]		AS [OwnerID]
		, f1.[FOLDER_SIZE]			AS [Size]
	FROM
		CTE_Folders AS f1
		INNER JOIN [file].[Folders] AS f2
			ON f1.FOLDER_FOLDERID = f2.FOLDER_ID 

	UNION

	SELECT
		'File'					AS [Type]
		, [FILE_FOLDERID]		AS [FolderID]
		, [FOLDER_NAME]			AS [FolderName]
		, [FILE_ID]				AS [ID]		
		, [FILE_UPLOADED]		AS [Created]
		, [FILE_USERID]			AS [CreaetdByID]
		, [FILE_DESCRIPTION]	AS [Description]
		, [FILE_NAME]			AS [Name]
		, [FILE_USERID]			AS [OwnerID]
		, [FILE_SIZE]			AS [Size]
	FROM
		CTE_Files AS c
		INNER JOIN [file].[Folders] AS f
			ON c.FILE_FOLDERID = f.FOLDER_ID 

	OPTION (MAXRECURSION 0)
END
GO