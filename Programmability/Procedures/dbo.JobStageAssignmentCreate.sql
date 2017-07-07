SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobStageAssignmentCreate] 
	@JobID int,
	@StageGUID uniqueidentifier,
	@UserID int,
	@Assigned datetime,
	@Closed datetime = NULL
AS
BEGIN
	
	SEt NOCOUNT ON;
	
	IF EXISTS(SELECT ASSIGNMENT_ID FROM tblJobStageAssignments 
			  WHERE (ASSIGNMENT_JOBID = @JobID) AND
					(ASSIGNMENT_STAGEGUID = @StageGUID) AND
					(ASSIGNMENT_CLOSED = NULL))
		RETURN 0;
				
	INSERT tblJobStageAssignments
	(
		ASSIGNMENT_JOBID,
		ASSIGNMENT_STAGEGUID,
		ASSIGNMENT_USERID,
		ASSIGNMENT_ASSIGNED,
		ASSIGNMENT_CLOSED
	)
	OUTPUT
		inserted.ASSIGNMENT_ID AS ID, inserted.ASSIGNMENT_ROWVERSION AS [VERSION]
	VALUES
	(
		@JobID,
		@StageGUID,
		@UserID,
		@Assigned,
		@Closed
	);
END
GO