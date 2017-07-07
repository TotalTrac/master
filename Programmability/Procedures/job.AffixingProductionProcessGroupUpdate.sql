﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingProductionProcessGroupUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingProductionProcessGroupUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingProductionProcessGroupUpdate]
@Version				timestamp,
	@Id int,
	@Processid int,
	@Affixingitemid int
    
AS

SET NOCOUNT ON

UPDATE [job].[AffixingProductionProcessGroups] SET
	[ProcessId] = @Processid,
	[AffixingItemId] = @Affixingitemid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO