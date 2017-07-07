﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptsGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		INVENTORYRECEIPT_ID,			
			INVENTORYRECEIPT_CREATED,
			INVENTORYRECEIPT_CREATEDBYID
			INVENTORYRECEIPT_DESCRIPTION,			
			INVENTORYRECEIPT_RECEIVED,
			INVENTORYRECEIPT_RECEIVEDBY,		
			INVENTORYRECEIPT_SHIPCOMPANY,
			INVENTORYRECEIPT_SUPPLIERCOMPANY,			
			INVENTORYRECEIPT_ROWVERSION
	FROM 
		[dbo].[InventoryReceipts];
END
GO