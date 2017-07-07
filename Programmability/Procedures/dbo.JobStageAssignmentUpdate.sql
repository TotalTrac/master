SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobStageAssignmentUpdate]
	@ID int, 
	@JobID int,
	@StageGUID uniqueidentifier,
	@UserID int,
	@Assigned datetime,
	@Closed datetime = NULL,
	@Version timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF EXISTS(SELECT ASSIGNMENT_ID 
			  FROM tblJobStageAssignments 
			  WHERE (ASSIGNMENT_JOBID = @JobID) AND
					(ASSIGNMENT_STAGEGUID = @StageGUID) AND
					(ASSIGNMENT_ID <> @ID) AND
					(ASSIGNMENT_CLOSED = NULL))
		RETURN 1;
	
		
	UPDATE tblJobStageAssignments
	SET
		ASSIGNMENT_JOBID = @JOBID,
		ASSIGNMENT_STAGEGUID = @StageGUID,
		ASSIGNMENT_USERID = @UserID,
		ASSIGNMENT_ASSIGNED = @Assigned,
		ASSIGNMENT_CLOSED = @Closed
	OUTPUT
		inserted.ASSIGNMENT_ID AS ID, inserted.ASSIGNMENT_ROWVERSION AS [VERSION]
	WHERE 
		ASSIGNMENT_ID = @ID AND 
		ASSIGNMENT_ROWVERSION = @Version;
END
GO