﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobStageAssignmentsGetByUserID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM tblJobStageAssignments WHERE ASSIGNMENT_USERID = @ID;

END
GO