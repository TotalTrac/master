SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AssignmentUpdate]
	@ID			int
	, @JobID		int
	, @UserID		int
	, @Version	timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE Assignments
	SET
		ASSIGNMENT_JOBID = @JobID
		, ASSIGNMENT_USERID = @UserID
	OUTPUT
		inserted.ASSIGNMENT_ID AS ID, inserted.ASSIGNMENT_ROWVERSION AS [VERSION]
	WHERE
		(ASSIGNMENT_ID = @ID) AND
		(ASSIGNMENT_ROWVERSION = @Version);	
END
GO