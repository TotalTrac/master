﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[DeleteLogsByReportid]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[DeleteLogsByReportid]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[DeleteLogsByReportid]
	@Reportid int
AS

SET NOCOUNT ON

DELETE FROM [laser].[Logs]
WHERE
	[LOG_REPORTID] = @Reportid
GO