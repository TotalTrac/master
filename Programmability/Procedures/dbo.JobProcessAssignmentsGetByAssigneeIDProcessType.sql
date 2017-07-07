SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentsGetByAssigneeIDProcessType] 
	@AssigneeID		int,
	@ProcessType	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM tblJobProcessAssignments 
	WHERE (ASSIGNMENT_ASSIGNEEID = @AssigneeID) AND
	(ASSIGNMENT_PROCESSTYPE = @ProcessType);
END
GO