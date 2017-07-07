SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemUpdate]
	@ID						int
	, @DateTime				datetime
	, @InsertionItemID		int
	, @ProductionQuantity	int
	, @WasteQuantity		int
	, @Version				timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[InventoryUsageItems]
	SET
		[DateTime]				= @DateTime
		, [InsertionItemId]		= @InsertionItemID		
		, ProductionQuantity	= @ProductionQuantity
		, WasteQuantity			= @WasteQuantity
	OUTPUT
		inserted.Id AS ID, inserted.RowVersion AS [VERSION]
	WHERE
		([Id] = @ID)
		AND ([RowVersion] = @Version);	
END
GO