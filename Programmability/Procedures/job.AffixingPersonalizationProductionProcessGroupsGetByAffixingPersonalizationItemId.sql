﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationProductionProcessGroupsGetByAffixingPersonalizationItemId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationProductionProcessGroupsGetByAffixingPersonalizationItemId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationProductionProcessGroupsGetByAffixingPersonalizationItemId]
	@Id int
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
WHERE
	[AffixingPersonalizationItemId] = @Id

--endregion

GO