﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[InsertionItemUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[InsertionItemUpdate]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[InsertionItemUpdate]
@Version				timestamp,
	@Id int,
	@Facesflap bit,
	@Inventoryitemid int,
	@Kitid int,
  @Name             varchar(100),
	@Wastepercent float,
	@Wasteperrun int,
	@Zindex int
    
AS

SET NOCOUNT ON

UPDATE [job].[InsertionItems] SET
	[FacesFlap] = @Facesflap,
	[InventoryItemId] = @Inventoryitemid,
	[KitId] = @Kitid,
  Name = @Name,
	[WastePercent] = @Wastepercent,
	[WastePerRun] = @Wasteperrun,
	[ZIndex] = @Zindex
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO