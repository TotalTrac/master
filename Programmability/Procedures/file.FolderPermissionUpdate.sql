SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderPermissionUpdate]
	@ID				int
	, @FolderID		int
	, @Privileges	int
	, @UserID		int
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		[file].[FolderPermissions]
	SET	
		FOLDERPERMISSION_FOLDERID		= @FolderID
		, FOLDERPERMISSION_PRIVILEGES	= @Privileges
		, FOLDERPERMISSION_USERID		= @UserID	
	OUTPUT
		inserted.FOLDERPERMISSION_ID AS ID, inserted.FOLDERPERMISSION_ROWVERSION AS [VERSION]
	WHERE
		FOLDERPERMISSION_ID = @ID
		AND FOLDERPERMISSION_ROWVERSION = @Version
END
GO