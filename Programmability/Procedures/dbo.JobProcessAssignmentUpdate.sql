SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentUpdate]
	@ID						int,
	@Assigned				datetime = NULL,
	@AssigneeID				int,
	@BillableTime			nchar(25),
	@Canceled				bit,
	@Closed					datetime = NULL,	
	@JobStageAssignmentID	int,	
	@ProcessID				uniqueidentifier,
	@ProcessType			int,
	@Version				timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE tblJobProcessAssignments
	SET
		ASSIGNMENT_ASSIGNED = @Assigned,
		ASSIGNMENT_ASSIGNEEID = @AssigneeID,
		ASSIGNMENT_BILLABLETIME = @BillableTime,
		--ASSIGNMENT_CANCELED = @Canceled,
		ASSIGNMENT_CLOSED = @Closed,		
		--ASSIGNMENT_JOBSTAGEASSIGNMENTID = @JobStageAssignmentID,
		ASSIGNMENT_PROCESSID = @ProcessID,
		ASSIGNMENT_PROCESSTYPE = @ProcessType
	OUTPUT
		inserted.ASSIGNMENT_ID AS ID, inserted.ASSIGNMENT_ROWVERSION AS [VERSION]
	WHERE (ASSIGNMENT_ID = @ID) AND
		(ASSIGNMENT_ROWVERSION = @Version);
END
GO