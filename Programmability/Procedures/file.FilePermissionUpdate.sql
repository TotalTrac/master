SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [file].[FilePermissionUpdate]
	@ID				int
	, @FileID		int
	, @Privileges	int
	, @UserID		int
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE 
		[file].[FilePermissions]
	SET	
		FILEPERMISSION_METADATAID		= @FileID
		, FILEPERMISSION_PRIVILEGES	= @Privileges
		, FILEPERMISSION_USERID		= @UserID	
	OUTPUT
		inserted.FILEPERMISSION_ID AS ID, inserted.FILEPERMISSION_ROWVERSION AS [VERSION]
	WHERE
		FILEPERMISSION_ID = @ID
		AND FILEPERMISSION_ROWVERSION = @Version
END
GO