﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[DataSetupProcessGroupUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[DataSetupProcessGroupUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[DataSetupProcessGroupUpdate]
@Version				timestamp,
	@Id int,
	@Processid int,
	@Dataprocessingitemid int
    
AS

SET NOCOUNT ON

UPDATE [job].[DataSetupProcessGroups] SET
	[ProcessId] = @Processid,
	[DataProcessingItemId] = @Dataprocessingitemid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO