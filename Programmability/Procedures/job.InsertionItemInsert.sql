﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[InsertionItemInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[InsertionItemInsert]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionItemInsert]
	@Facesflap bit,
	@Inventoryitemid int,
	@Kitid int,
  @Name             varchar(100),
	@Wastepercent float,
	@Wasteperrun int,
	@Zindex int

AS

SET NOCOUNT ON

INSERT INTO [job].[InsertionItems] (
	[FacesFlap],
	[InventoryItemId],
	[KitId],
  Name,
	[WastePercent],
	[WastePerRun],
	[ZIndex]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Facesflap,
	@Inventoryitemid,
	@Kitid,
  @Name,
	@Wastepercent,
	@Wasteperrun,
	@Zindex
)

--endregion

GO