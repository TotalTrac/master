﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[ProductionProcessesGetByMachineId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessesGetByMachineId]
-- Date Generated: Friday, September 9, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessesGetByFoldingItemId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	pp.[Id],
	[MachineId],
	[Notes],
	[OperatorId],
	[ProcessType],
	[ScheduledEndTime],
	[ScheduledStartTime],
	[StartTime],
	[StopTime],
	pp.[RowVersion]
FROM
	[job].[ProductionProcesses] pp
  INNER JOIN job.FoldingProductionProcessGroups ippg ON ippg.ProcessId = pp.Id
WHERE
	ippg.FoldingItemId = @Id

--endregion
GO