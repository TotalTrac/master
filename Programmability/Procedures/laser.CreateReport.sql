﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[CreateReport]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[CreateReport]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[CreateReport]
	@TotalPrintedSheets int,
	@TotalPrintedPages int,
	@ClickCost int,
	@PrintCost int,
	@JobStarted datetime,
	@JobLastFinished datetime,
	@RunDuration int,
	@PrintersUsed int,
	@JobId int,
	@Id int 
AS

SET NOCOUNT ON

INSERT INTO [laser].[Reports] (
	[REPORT_TOTALPRINTEDSHEETS],
	[REPORT_TOTALPRINTEDPAGES],
	[REPORT_CLICKCOST],
	[REPORT_PRINTCOST],
	[REPORT_JOBSTARTED],
	[REPORT_JOBLASTFINISHED],
	[REPORT_RUNDURATION],
	[REPORT_PRINTERSUSED],
	[REPORT_JOBID]
) 
OUTPUT inserted.REPORT_ID AS ID, inserted.REPORT_ROWVERSION AS [VERSION]
		
VALUES (
	@TotalPrintedSheets,
	@TotalPrintedPages,
	@ClickCost,
	@PrintCost,
	@JobStarted,
	@JobLastFinished,
	@RunDuration,
	@PrintersUsed,
	@JobId
)

SET @Id = SCOPE_IDENTITY()

--endregion
GO