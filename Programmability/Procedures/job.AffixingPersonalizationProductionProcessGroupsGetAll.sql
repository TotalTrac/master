﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationProductionProcessGroupsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationProductionProcessGroupsGetAll]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationProductionProcessGroupsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ProcessId],
	[AffixingPersonalizationItemId],
	[RowVersion]
FROM
	[job].[AffixingPersonalizationProductionProcessGroups]

--endregion

GO