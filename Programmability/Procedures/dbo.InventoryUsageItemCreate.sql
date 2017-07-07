SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemCreate]
	@DateTime				datetime
	, @InsertionItemID		int
	, @ProductionQuantity	int
	, @WasteQuantity		int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[InventoryUsageItems]
	(
		[DateTime]
		, InsertionItemId		
		, ProductionQuantity
		, WasteQuantity
	)
	OUTPUT
		inserted.Id AS ID, inserted.RowVersion AS [VERSION]
	VALUES
	(
		@DateTime
		, @InsertionItemID
		, @ProductionQuantity
		, @WasteQuantity
	);
END
GO