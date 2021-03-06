﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[KitsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[KitsGetAll]
-- Date Generated: Friday, January 8, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[KitsGetAllPendingByPriorToMailDate]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT DISTINCT
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
	LEFT JOIN job.KitSetupProcessGroups kspg ON k.Id = kspg.KitId
  LEFT JOIN job.ProductionProcesses sp ON kspg.ProcessId = sp.Id
  WHERE sp.StopTime IS NULL AND k.DropDate < dateadd(dd,7,getdate())

--endregion
GO