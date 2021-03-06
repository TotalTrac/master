﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ProductionProcessCountUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessCountUpdate]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessCountUpdate]
@Version				timestamp,
	@Id int,
	@Inspectorid int,
	@Count int,
	@Counttime datetime,
	@Productionprocessid int
    
AS

SET NOCOUNT ON

UPDATE [job].[ProductionProcessCounts] SET
	[InspectorId] = @Inspectorid,
	[Count] = @Count,
	[CountTime] = @Counttime,
	[ProductionProcessId] = @Productionprocessid
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO