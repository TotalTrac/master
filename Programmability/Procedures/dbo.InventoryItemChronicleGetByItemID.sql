﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemChronicleGetByItemID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
 --   DECLARE @ReceiptID int;    
 --   SET @ReceiptID = (
	--SELECT TOP 1
	--	INVENTORYRECEIPT_ID				
 --   FROM
	--	[dbo].[InventoryReceipts]
 --   WHERE 
	--	INVENTORYRECEIPT_INVENTORYITEMID = @ID
 --   ORDER BY 
	--	INVENTORYRECEIPT_RECEIVED DESC);
		
	--DECLARE @UsageID int;    
 --   SET @UsageID = (
	--SELECT TOP 1
	--	INVENTORYUSAGEITEM_ID				
 --   FROM
	--	[dbo].[InventoryUsageItems]
 --   WHERE 
	--	INVENTORYUSAGEITEM_INVENTORYITEMID = @ID
 --   ORDER BY 
	--	INVENTORYUSAGEITEM_DATETIME DESC);
		
	--DECLARE @AdjustmetID int;    
 --   SET @AdjustmetID = (
	--SELECT TOP 1
	--	ADJUSTMENT_ID				
 --   FROM
	--	[dbo].[InventoryAdjustments]
 --   WHERE 
	--	ADJUSTMENT_INVENTORYITEMID = @ID
 --   ORDER BY 
	--	ADJUSTMENT_CREATED DESC);
		
	--DECLARE @Table TABLE
	--(
	--  INVENTORYITEMCHRONICLE_LASTADJUSTMENTID int NULL,
	--  INVENTORYITEMCHRONICLE_LASTRECEIPTID int NULL,
	--  INVENTORYITEMCHRONICLE_LASTUSAGEID int NULL
	--);
	
	--INSERT INTO @Table ( INVENTORYITEMCHRONICLE_LASTADJUSTMENTID, INVENTORYITEMCHRONICLE_LASTRECEIPTID, INVENTORYITEMCHRONICLE_LASTUSAGEID)
	--VALUES (@AdjustmetID, @ReceiptID, @UsageID);
	
	--SELECT * FROM @Table;
END
GO