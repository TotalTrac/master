﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[DeleteWorkflowParameter]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[DeleteWorkflowParameter]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[DeleteWorkflowParameter]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [laser].[WorkflowParameters]
WHERE
	[WORKFLOWPARAM_ID] = @Id

--endregion
GO