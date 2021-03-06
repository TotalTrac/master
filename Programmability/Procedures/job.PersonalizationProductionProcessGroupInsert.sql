﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[PersonalizationProductionProcessGroupInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[PersonalizationProductionProcessGroupInsert]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[PersonalizationProductionProcessGroupInsert]
	@Processid int,
	@Insertionpersonalizationitemid int

AS

SET NOCOUNT ON

INSERT INTO [job].[PersonalizationProductionProcessGroups] (
	[ProcessId],
	[InsertionPersonalizationItemId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Processid,
	@Insertionpersonalizationitemid
)

--endregion

GO