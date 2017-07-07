SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderUpdate]
	@ID				int
	, @Created		datetime
	, @CreatedById	int
	, @Description	nvarchar(200) = NULL		
	, @Name			nvarchar(100)
	, @FolderID		int = NULL	
	, @UserID		int
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [file].[Folders]
	SET
		FOLDER_CREATED			= @Created
		, FOLDER_CREATEDBYID	= @CreatedById
		, FOLDER_DESCRIPTION	= @Description
		, FOLDER_NAME			= @Name
		, FOLDER_FOLDERID		= @FolderID
		, FOLDER_USERID			= @UserID	
	OUTPUT
		inserted.FOLDER_ID AS ID, inserted.FOLDER_ROWVERSION AS [VERSION]
	WHERE
		FOLDER_ID = @ID
		AND FOLDER_ROWVERSION = @Version;
END
GO