﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentsGetByJobStageAssignmentID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM tblJobProcessAssignments WHERE ASSIGNMENT_JOBID = @ID;
END
GO