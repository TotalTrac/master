﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobStageRoleUpdate]
	@ID				int,
	@RoleID			int,
	@StageGUID		uniqueidentifier,
	@Version		timestamp	
AS
BEGIN

	SET NOCOUNT ON;
		
	UPDATE tblJobStageRoles
	SET
		JOBSTAGEROLE_ROLEID = @RoleID,
		JOBSTAGEROLE_STAGEGUID = @StageGUID
	OUTPUT
		inserted.JOBSTAGEROLE_ID AS ID, inserted.JOBSTAGEROLE_ROWVERSION AS [VERSION]
	WHERE
		(JOBSTAGEROLE_ID = @ID) AND
		(JOBSTAGEROLE_ROWVERSION = @Version);
END
GO