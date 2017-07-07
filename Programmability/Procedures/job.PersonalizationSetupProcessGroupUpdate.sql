﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[PersonalizationSetupProcessGroupUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[PersonalizationSetupProcessGroupUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[PersonalizationSetupProcessGroupUpdate]
@Version				timestamp,
	@Id int,
	@Processid int,
	@Insertionpersonalizationitemid int
    
AS

SET NOCOUNT ON

UPDATE [job].[PersonalizationSetupProcessGroups] SET
	[ProcessId] = @Processid,
	[InsertionPersonalizationItemId] = @Insertionpersonalizationitemid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO