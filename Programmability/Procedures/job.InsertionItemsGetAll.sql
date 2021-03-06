﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[InsertionItemsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[InsertionItemsGetAll]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionItemsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[FacesFlap],
	[InventoryItemId],
	[KitId],
  Name,
	[WastePercent],
	[WastePerRun],
	[ZIndex],
	[RowVersion]
FROM
	[job].[InsertionItems]

--endregion

GO