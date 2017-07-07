﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[GetLogsByJobconfigid]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[GetLogsByJobconfigid]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[GetLogsByJobconfigid]
	@Jobconfigid int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[LOG_ID],
	[LOG_PNTVERSION],
	[LOG_JOBFILE],
	[LOG_PRINTENGINE],
	[LOG_STARTTIME],
	[LOG_ENDTIME],
	[LOG_ENDPAGE],
	[LOG_ENDCOPY],
	[LOG_PAGESPRINTED],
	[LOG_JOBCONFIGID],
	[LOG_WORKFLOWPARAMSID],
	[LOG_REPORTID],
	[LOG_LOGSTATUS],
	[LOG_DURATION],
	[LOG_PRINTER]
FROM
	[laser].[Logs]
WHERE
	[LOG_JOBCONFIGID] = @Jobconfigid

--endregion
GO