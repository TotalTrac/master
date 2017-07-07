SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderGetByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
    
	DECLARE @Size bigint;
		
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
		@Size = COALESCE(SUM(f.FILE_SIZE), 0)
	FROM
		CTE
		INNER JOIN [file].[Files] AS f
			ON CTE.FolderID = f.FILE_FOLDERID;

	SELECT
		FOLDER_ID
		, FOLDER_CREATED
		, FOLDER_CREATEDBYID
		, FOLDER_DESCRIPTION
		, FOLDER_FOLDERID
		, FOLDER_NAME
		, @Size AS [FOLDER_SIZE]
		, FOLDER_USERID
		, FOLDER_ROWVERSION
	FROM
		[file].[Folders]
	WHERE
		FOLDER_ID = @ID;
END
GO