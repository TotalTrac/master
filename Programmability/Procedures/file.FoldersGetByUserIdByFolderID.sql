SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FoldersGetByUserIdByFolderID]
	@ID			int
	, @FolderID	int = NULL
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
	)
	SELECT
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
		INNER JOIN (
				 SELECT RootID,
						sum(C.Size) AS [Size]
				 from CTE_HierarchialSizes AS c
				 group by RootID
				 ) AS S
		ON f.FOLDER_ID = S.RootID	
	WHERE
		-- owned folders
		(f.FOLDER_USERID = @ID AND (f.FOLDER_FOLDERID = @FolderID OR (f.FOLDER_FOLDERID IS NULL AND @FolderID IS NULL)))

		-- shared folders
		--OR (p.FOLDERPERMISSION_USERID = @ID AND p.FOLDERPERMISSION_PRIVILEGES > 0 AND (p.FOLDERPERMISSION_FOLDERID = @Filter OR (p.FOLDERPERMISSION_FOLDERID IS NULL AND @Filter IS NULL)));					
	OPTION (MAXRECURSION 0)


END
GO