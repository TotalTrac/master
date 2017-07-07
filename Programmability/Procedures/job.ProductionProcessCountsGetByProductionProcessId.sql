﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ProductionProcessCountsGetByProductionProcessId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessCountsGetByProductionProcessId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessCountsGetByProductionProcessId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[InspectorId],
	[Count],
	[CountTime],
	[ProductionProcessId],
	[RowVersion]
FROM
	[job].[ProductionProcessCounts]
WHERE
	[ProductionProcessId] = @Id

--endregion

GO