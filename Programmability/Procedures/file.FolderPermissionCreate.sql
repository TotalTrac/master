SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderPermissionCreate]
	@FolderID		int
	,@Privileges	int
	,@UserID		int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [file].[FolderPermissions]
	(
		FOLDERPERMISSION_FOLDERID
		, FOLDERPERMISSION_PRIVILEGES
		, FOLDERPERMISSION_USERID
	)
	OUTPUT
		inserted.FOLDERPERMISSION_ID AS ID, inserted.FOLDERPERMISSION_ROWVERSION AS [VERSION]
	VALUES
	(
		@FolderID
		, @Privileges
		, @UserID
	);
END
GO