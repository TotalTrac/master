SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JobStageAssignmentGetByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM tblJobStageAssignments WHERE ASSIGNMENT_ID = @ID;

END
GO