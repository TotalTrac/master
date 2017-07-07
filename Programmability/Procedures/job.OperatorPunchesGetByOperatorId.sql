﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[OperatorPunchesGetByOperatorId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[OperatorPunchesGetByOperatorId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[OperatorPunchesGetByOperatorId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[OperatorId],
	[PunchTime],
	[PunchTypeId],
	[RowVersion]
FROM
	[job].[OperatorPunches]
WHERE
	[OperatorId] = @Id

--endregion

GO