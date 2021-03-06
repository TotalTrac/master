﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptItemsGetByClientIDByDateRange] 
	@ID			int
	, @From		datetime = NULL
	, @To		datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		INVENTORYRECEIPTITEM_ID
		, INVENTORYRECEIPTITEM_CONTAINERCOUNT
		, INVENTORYRECEIPTITEM_CONTAINERS
		, INVENTORYRECEIPTITEM_CONTAINERTYPEID
    , INVENTORYRECEIPTITEM_ITEMID
    , INVENTORYRECEIPTITEM_NOTE
		, INVENTORYRECEIPTITEM_RECEIPTID
    ,INVENTORYRECEIPTITEM_ROWVERSION
	FROM 
		[dbo].[InventoryReceiptItems] AS iri
    INNER JOIN dbo.InventoryReceipts AS ir ON ir.INVENTORYRECEIPT_ID = iri.INVENTORYRECEIPTITEM_RECEIPTID
    INNER JOIN [dbo].[InventoryItems] AS i
			ON iri.INVENTORYRECEIPTITEM_ITEMID = i.[ID]

	WHERE 
		(i.[ClientID] = @ID)
		AND (@From IS NULL OR ir.INVENTORYRECEIPT_RECEIVED >= @From)
		AND (@To IS NULL OR ir.INVENTORYRECEIPT_RECEIVED <= @To)
	
END
GO