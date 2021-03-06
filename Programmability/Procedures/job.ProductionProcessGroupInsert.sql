﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[ProductionProcessGroupInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[ProductionProcessGroupInsert]
-- Date Generated: Friday, August 26, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[ProductionProcessGroupInsert]
	@Insertionitemid int,
	@Productionprocessid int

AS

SET NOCOUNT ON

INSERT INTO [job].[ProductionProcessGroups] (
	[InsertionItemId],
	[ProductionProcessId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Insertionitemid,
	@Productionprocessid
)

--endregion

GO