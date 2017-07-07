SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentCreate]
	@Assigned		datetime = NULL,
	@AssigneeID		int,
	@BillableTime	nchar(25),
	@Cancelled		bit,
	@Closed			datetime = NULL,	
	@JobID			int,	
	@ProcessID		uniqueidentifier,
	@ProcessType	int	
AS
BEGIN

	SET NOCOUNT ON;
	
	IF EXISTS(SELECT ASSIGNMENT_ID 
				FROM tblJobProcessAssignments 
				WHERE (ASSIGNMENT_ASSIGNEEID = @AssigneeID) AND
					  (ASSIGNMENT_JOBID = @JobID) AND
					  (ASSIGNMENT_PROCESSID = @ProcessID))
		RETURN -1;
		
	INSERT tblJobProcessAssignments
	(
		ASSIGNMENT_ASSIGNED,
		ASSIGNMENT_ASSIGNEEID,
		ASSIGNMENT_BILLABLETIME,
		ASSIGNMENT_CANCELLED,
		ASSIGNMENT_CLOSED,		
		ASSIGNMENT_JOBID,		
		ASSIGNMENT_PROCESSID,
		ASSIGNMENT_PROCESSTYPE
	)
	OUTPUT
		inserted.ASSIGNMENT_ID AS ID, inserted.ASSIGNMENT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Assigned,
		@AssigneeID,
		@BillableTime,
		@Cancelled,
		@Closed,		
		@JobID,
		@ProcessID,
		@ProcessType
	);
END
GO