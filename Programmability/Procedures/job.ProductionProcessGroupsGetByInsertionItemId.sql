﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ProductionProcessGroupsGetByInsertionItemId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessGroupsGetByInsertionItemId]
-- Date Generated: Friday, August 26, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessGroupsGetByInsertionItemId]
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
	[InsertionItemId] = @Id

--endregion

GO