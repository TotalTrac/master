SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FoldersGetByFolderId]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
    
	DECLARE @UserID int;
	
	SELECT @UserID = FOLDER_USERID FROM [file].[Folders] WHERE FOLDER_ID = @ID;

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
				f.FOLDER_USERID = @UserID OR f2.FILE_USERID = @UserID
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
		INNER JOIN (
				 SELECT RootID,
						sum(C.Size) AS [Size]
				 from CTE_HierarchialSizes AS c
				 group by RootID
				 ) AS S
		ON f.FOLDER_ID = S.RootID
	WHERE
		f.FOLDER_FOLDERID = @ID
	OPTION (MAXRECURSION 0)
	
END
GO