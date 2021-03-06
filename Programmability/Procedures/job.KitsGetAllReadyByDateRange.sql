﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[KitsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[KitsGetAll]
-- Date Generated: Friday, January 8, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[KitsGetAllReadyByDateRange]
  	@To DATETIME,
  @From DATETIME
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	k.[ID],
  CompleteMailing,
	Created,
	CreatedBy,
	[CsrUserId],
	[EstimatedQty],
	[Instructions],
	JobId,
	[DropDate],
	[Name],
	[ProductionKey],
	[SegmentID],
  k.StartTime,
  k.EndTime,
	[SoDueDate],
	k.[RowVersion]
FROM
  job.Kits k
	INNER JOIN job.KitSetupProcessGroups kspg ON k.Id = kspg.KitId
  INNER JOIN job.ProductionProcesses sp ON kspg.ProcessId = sp.Id
  WHERE sp.StopTime IS NOT NULL AND k.DropDate BETWEEN @From AND @To

--endregion
GO