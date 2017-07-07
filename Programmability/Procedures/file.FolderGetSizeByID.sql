SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderGetSizeByID]
	@ID	int
	, @Recursive bit
AS
BEGIN
	SET NOCOUNT ON;

    IF @Recursive = 0
		BEGIN
			SELECT 
				SUM(f.FILE_SIZE)
			FROM
				[file].[Files] AS f
			WHERE
				f.FILE_FOLDERID = @ID
		END
	ELSE
		BEGIN
			WITH CTE (FolderID)
			AS
			(
			-- Anchor member definition
				SELECT 					
					f.FOLDER_ID					
				FROM 
					[file].[Folders] AS f						
				WHERE 
					(f.FOLDER_ID = @ID)					
				UNION ALL
			-- Recursive member definition
				SELECT 					
					f.FOLDER_ID					
				FROM
					[file].[Folders] AS f					
					INNER JOIN CTE
						ON f.FOLDER_FOLDERID = CTE.FolderID				
			)
						
			SELECT 
				COALESCE(SUM(f.FILE_SIZE), 0)
			FROM
				CTE
				INNER JOIN [file].[Files] AS f
					ON CTE.FolderID = f.FILE_FOLDERID			
		END		
END
GO