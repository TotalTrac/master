﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptItemsGetPaged] 
	@Page			int
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
			ROW_NUMBER() OVER (ORDER BY INVENTORYRECEIPTITEM_ID DESC, INVENTORYRECEIPT_RECEIVED DESC) AS ResultNum
		,	INVENTORYRECEIPTITEM_ID
		, INVENTORYRECEIPTITEM_CONTAINERCOUNT
		, INVENTORYRECEIPTITEM_CONTAINERS
		, INVENTORYRECEIPTITEM_CONTAINERTYPEID
    , INVENTORYRECEIPTITEM_ITEMID
    , INVENTORYRECEIPTITEM_NOTE
		, INVENTORYRECEIPTITEM_RECEIPTID
      ,INVENTORYRECEIPTITEM_ROWVERSION
		FROM [dbo].[InventoryReceiptItems]
    INNER JOIN dbo.InventoryReceipts ir ON ir.INVENTORYRECEIPT_ID = INVENTORYRECEIPTITEM_RECEIPTID
		) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	 
		
END
GO