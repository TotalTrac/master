﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationSetupProcessGroupsGetByAffixingPersonalizationItemId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationSetupProcessGroupsGetByAffixingPersonalizationItemId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationSetupProcessGroupsGetByAffixingPersonalizationItemId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AffixingPersonalizationSetupProcessId],
	[AffixingPersonalizationItemId],
	[RowVersion]
FROM
	[job].[AffixingPersonalizationSetupProcessGroups]
WHERE
	[AffixingPersonalizationItemId] = @Id

--endregion

GO