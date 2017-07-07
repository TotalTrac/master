SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemGetQuantityOnHand] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @Received int;
	DECLARE @Adjustments int;
	DECLARE @Used int;
	DECLARE @ProductionUsage int;
	DECLARE @WasteUsage int;

	Set @Received = (SELECT 
		ISNULL((SUM(INVENTORYRECEIPTITEM_CONTAINERS * INVENTORYRECEIPTITEM_CONTAINERCOUNT)), 0) AS RECEIVED
	FROM (
		SELECT * 
		FROM [dbo].[InventoryReceiptItems]
		JOIN [dbo].[InventoryReceipts]
		ON INVENTORYRECEIPTITEM_RECEIPTID = INVENTORYRECEIPT_ID) a
		 	
	WHERE INVENTORYRECEIPTITEM_ITEMID = @ID); 

	Set @Adjustments = (SELECT ISNULL(SUM(ADJUSTMENT_ADJUSTMENT), 0) AS ADJUSTMENTS 
		FROM [dbo].[InventoryAdjustments]
		WHERE ADJUSTMENT_INVENTORYITEMID = @ID);
		
	Set @ProductionUsage = (SELECT ISNULL(SUM([u].[ProductionQuantity]), 0) AS PRODUCTIONUSAGE 
		FROM
			[dbo].[InventoryUsageItems] AS u
			INNER JOIN [job].[InsertionItems] AS i
				ON [u].[InsertionItemId] = [i].[Id] 
		WHERE 
			([i].[InventoryItemId] = @ID));
		
	Set @WasteUsage = (SELECT ISNULL(SUM([u].[WasteQuantity]), 0) AS WASTEUSAGE 
		FROM
			[dbo].[InventoryUsageItems] AS u
			INNER JOIN [job].[InsertionItems] AS i
				ON [u].[InsertionItemId] = [i].[Id] 
		WHERE 
			([i].[InventoryItemId] = @ID));
		
	RETURN @Received + @Adjustments - (@ProductionUsage + @WasteUsage);

END
GO