SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentsGetByJobIDProcessID]
	@ID			int,
	@ProcessID	uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM tblJobProcessAssignments 
	WHERE (ASSIGNMENT_JOBID = @ID) AND
		  (ASSIGNMENT_PROCESSID = @ProcessID);
END
GO