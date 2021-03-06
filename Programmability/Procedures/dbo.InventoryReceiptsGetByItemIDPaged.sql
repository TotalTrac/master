﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptsGetByItemIDPaged] 
	@ID				int
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DECLARE @StartRow int,
		@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY INVENTORYRECEIPTITEM_ID DESC, ri.INVENTORYRECEIPT_RECEIVED DESC) AS ResultNum, 
			INVENTORYRECEIPTITEM_ID
		, INVENTORYRECEIPTITEM_CONTAINERCOUNT
		, INVENTORYRECEIPTITEM_CONTAINERS
		, INVENTORYRECEIPTITEM_CONTAINERTYPEID
    , INVENTORYRECEIPTITEM_ITEMID
		, INVENTORYRECEIPTITEM_RECEIPTID
		FROM [dbo].[InventoryReceiptItems]
      INNER JOIN InventoryReceipts ri ON ri.INVENTORYRECEIPT_ID = INVENTORYRECEIPTITEM_RECEIPTID
		WHERE INVENTORYRECEIPT_ID IN (
			SELECT INVENTORYRECEIPTITEM_ID FROM [dbo].[InventoryReceiptItems] 
        INNER JOIN dbo.InventoryReceipts ri ON ri.INVENTORYRECEIPT_ID = INVENTORYRECEIPTITEM_RECEIPTID
			WHERE INVENTORYRECEIPTITEM_ITEMID = @ID))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;			
END
GO