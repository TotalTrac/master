﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[CuttingProductionScheduleDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[CuttingProductionScheduleDeleteById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[CuttingProductionScheduleDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[CuttingProductionSchedule]
WHERE
	[Id] = @Id

--endregion

GO