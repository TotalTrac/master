﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[CuttingProductionScheduleUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[CuttingProductionScheduleUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CuttingProductionScheduleUpdate]
@Version				timestamp,
	@Id int,
	@Scheduledstarttime datetime,
	@Expectedendtime datetime,
	@Processgroupid int,
	@Notes varchar(5000)
    
AS

SET NOCOUNT ON

UPDATE [job].[CuttingProductionSchedule] SET
	[ScheduledStartTime] = @Scheduledstarttime,
	[ExpectedEndTime] = @Expectedendtime,
	[ProcessGroupId] = @Processgroupid,
	[Notes] = @Notes
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO