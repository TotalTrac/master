SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [file].[FilePermissionsCreate]
	@FileID		int
	,@Privileges	int
	,@UserID		int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [file].[FilePermissions]
	(
		FILEPERMISSION_METADATAID
		, FILEPERMISSION_PRIVILEGES
		, FILEPERMISSION_USERID
	)
	OUTPUT
		inserted.FILEPERMISSION_ID AS ID, inserted.FILEPERMISSION_ROWVERSION AS [VERSION]
	VALUES
	(
		@FileID
		, @Privileges
		, @UserID
	);
END
GO