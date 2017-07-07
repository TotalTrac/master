﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [file].[FilePermissionGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		FILEPERMISSION_ID
		, FILEPERMISSION_METADATAID
		, FILEPERMISSION_PRIVILEGES
		, FILEPERMISSION_USERID
		, FILEPERMISSION_ROWVERSION
	FROM
		[file].[FilePermissions]
	WHERE
		FILEPERMISSION_ID = @ID;
END
GO