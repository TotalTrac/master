﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[SetupProcessInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SetupProcessInsert]
-- Date Generated: Friday, September 9, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SetupProcessInsert]
	@Userid int,
	@Machineid int,
	@Notes varchar(5000),
	@Processtypeid int,
	@Scheduledendtime datetime,
	@Scheduledstarttime datetime,
	@Starttime datetime,
	@Stoptime datetime

AS

SET NOCOUNT ON

INSERT INTO [job].[SetupProcesses] (
	[UserId],
	[MachineId],
	[Notes],
	[ProcessTypeId],
	[ScheduledEndTime],
	[ScheduledStartTime],
	[StartTime],
	[StopTime]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Userid,
	@Machineid,
	@Notes,
	@Processtypeid,
	@Scheduledendtime,
	@Scheduledstarttime,
	@Starttime,
	@Stoptime
)

--endregion

GO