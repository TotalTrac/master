SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemGetAllocated] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		COALESCE(SUM([u].[ProductionQuantity] + [u].[WasteQuantity]), 0) 
	FROM
		[dbo].[InventoryUsageItems] AS u
		INNER JOIN [job].[InsertionItems] AS i
			ON [u].[InsertionItemId] = [i].[Id] 
	WHERE 
		([i].[InventoryItemId] = @ID)
		AND ([u].[DateTime] > GETDATE());
END
GO