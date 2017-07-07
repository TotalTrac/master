SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentsGetByJobStageAssignmentIDProcessID]
	@ID			int,
	@ProcessID	uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM tblJobProcessAssignments 
	WHERE (ASSIGNMENT_JOBSTAGEASSIGNMENTID = @ID) AND
		  (ASSIGNMENT_PROCESSID = @ProcessID);
END
GO