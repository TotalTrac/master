﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region job.[JobCuttingItemsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: job.[JobCuttingItemsGetAll]
-- Date Generated: Monday, January 18, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CuttingItemsGetAllReadyByDateRange]
  	@To DATETIME,
  @From DATETIME
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	ci.[Id],
	[FinalCount],
	[FinalHeight],
	[FinalWidth],
	[LocationType],
	[ItemId],
  ci.StartTime,
  ci.EndTime,
	ci.[Rowversion]
FROM
	job.[CuttingItems] ci
  INNER JOIN job.InsertionItems ii ON ii.Id = ci.ItemId
  INNER JOIN job.Kits AS k ON k.Id = ii.KitId
  INNER JOIN job.KitSetupProcessGroups kspg ON k.Id = kspg.KitId
  INNER JOIN job.ProductionProcesses sp ON kspg.ProcessId = sp.Id
  WHERE sp.StopTime IS NOT NULL AND k.DropDate BETWEEN @From AND @To

--endregion
GO