﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderPermissionsGetByUserIDByFolderID]
	@UserID	int,
	@FolderID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		FOLDERPERMISSION_ID
		, FOLDERPERMISSION_FOLDERID
		, FOLDERPERMISSION_PRIVILEGES
		, FOLDERPERMISSION_USERID
		, FOLDERPERMISSION_ROWVERSION
	FROM
		[file].[FolderPermissions]
	WHERE
		FOLDERPERMISSION_USERID = @UserID
		AND FOLDERPERMISSION_FOLDERID = @FolderID;
END
GO