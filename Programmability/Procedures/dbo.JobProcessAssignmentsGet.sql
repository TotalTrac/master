SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobProcessAssignmentsGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM tblJobProcessAssignments;
END
GO