SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderGetAncestorsByID]
	@ID	int	
AS
BEGIN
	SET NOCOUNT ON;
	    
	WITH CTE 
	(	
		FOLDER_ID
		, FOLDER_CREATED
		, FOLDER_CREATEDBYID
		, FOLDER_DESCRIPTION 					
		, FOLDER_FOLDERID	
		, FOLDER_NAME
		, FOLDER_SIZE
		, FOLDER_USERID
		, FOLDER_ROWVERSION				
	)
	AS
	(
	-- Anchor member definition
		SELECT
			f.FOLDER_ID
			, f.FOLDER_CREATED
			, f.FOLDER_CREATEDBYID
			, f.FOLDER_DESCRIPTION 					
			, f.FOLDER_FOLDERID	
			, f.FOLDER_NAME
			, CONVERT(BIGINT, 0)
			, f.FOLDER_USERID
			, f.FOLDER_ROWVERSION
		FROM 
			[file].[Folders] AS f						
		WHERE 
			(f.FOLDER_ID = @ID)					
		UNION ALL
	-- Recursive member definition
		SELECT 					
			f.FOLDER_ID
			, f.FOLDER_CREATED
			, f.FOLDER_CREATEDBYID
			, f.FOLDER_DESCRIPTION 					
			, f.FOLDER_FOLDERID	
			, f.FOLDER_NAME
			, CONVERT(BIGINT, 0)
			, f.FOLDER_USERID
			, f.FOLDER_ROWVERSION
		FROM
			[file].[Folders] AS f					
			INNER JOIN CTE
				ON f.FOLDER_ID = CTE.FOLDER_FOLDERID
	)
				
	SELECT 
		*
	FROM
		CTE;
END
GO