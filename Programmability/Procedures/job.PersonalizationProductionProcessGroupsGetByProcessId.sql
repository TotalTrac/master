﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[PersonalizationProductionProcessGroupsGetByProcessId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[PersonalizationProductionProcessGroupsGetByProcessId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[PersonalizationProductionProcessGroupsGetByProcessId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ProcessId],
	[InsertionPersonalizationItemId],
	[RowVersion]
FROM
	[job].[PersonalizationProductionProcessGroups]
WHERE
	[ProcessId] = @Id

--endregion

GO