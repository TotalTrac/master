SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	WITH    q AS
        (
        SELECT  
			FOLDER_ID
        FROM    
			[file].[Folders]
        WHERE   
			FOLDER_ID = @ID
                
        UNION ALL

        SELECT  
			tc.FOLDER_ID
        FROM    q
			JOIN [file].[Folders] tc
				ON tc.FOLDER_FOLDERID = q.FOLDER_ID                
        )
	DELETE
	FROM
		[file].[Folders]
	WHERE	EXISTS
    (
        SELECT  
			FOLDER_ID
        INTERSECT
        SELECT  
			FOLDER_ID
        FROM
			q
    );

	--DELETE 
	--	[file].[Folders]
	--WHERE 
	--	FOLDER_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO