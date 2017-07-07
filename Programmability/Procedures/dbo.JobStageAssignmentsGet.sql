SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JobStageAssignmentsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM tblJobStageAssignments;

END
GO