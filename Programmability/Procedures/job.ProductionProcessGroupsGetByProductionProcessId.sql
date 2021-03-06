﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ProductionProcessGroupsGetByProductionProcessId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessGroupsGetByProductionProcessId]
-- Date Generated: Friday, August 26, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessGroupsGetByProductionProcessId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[InsertionItemId],
	[ProductionProcessId],
	[RowVersion]
FROM
	[job].[ProductionProcessGroups]
WHERE
	[ProductionProcessId] = @Id

--endregion

GO