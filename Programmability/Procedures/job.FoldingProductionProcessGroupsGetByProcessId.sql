﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FoldingProductionProcessGroupsGetByProcessId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FoldingProductionProcessGroupsGetByProcessId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FoldingProductionProcessGroupsGetByProcessId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ProcessId],
	[FoldingItemId],
	[RowVersion]
FROM
	[job].[FoldingProductionProcessGroups]
WHERE
	[ProcessId] = @Id

--endregion

GO