﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationSetupProcessGroupUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationSetupProcessGroupUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationSetupProcessGroupUpdate]
@Version				timestamp,
	@Id int,
	@Affixingpersonalizationsetupprocessid int,
	@Affixingpersonalizationitemid int
    
AS

SET NOCOUNT ON

UPDATE [job].[AffixingPersonalizationSetupProcessGroups] SET
	[AffixingPersonalizationSetupProcessId] = @Affixingpersonalizationsetupprocessid,
	[AffixingPersonalizationItemId] = @Affixingpersonalizationitemid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO