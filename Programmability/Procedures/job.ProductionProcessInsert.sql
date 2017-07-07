SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ProductionProcessInsert]
	@Machineid int,
	@Notes varchar(5000),
	@Operatorid int,
	@Processtype int,
	@Scheduledendtime datetime,
	@Scheduledstarttime datetime,
	@Starttime datetime,
	@Stoptime datetime

AS

SET NOCOUNT ON

INSERT INTO [job].[ProductionProcesses] (
	[MachineId],
	[Notes],
	[OperatorId],
	[ProcessType],
	[ScheduledEndTime],
	[ScheduledStartTime],
	[StartTime],
	[StopTime]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Machineid,
	@Notes,
	@Operatorid,
	@Processtype,
	@Scheduledendtime,
	@Scheduledstarttime,
	@Starttime,
	@Stoptime
)
GO