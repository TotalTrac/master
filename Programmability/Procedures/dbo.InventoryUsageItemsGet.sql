SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemsGet]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		[Id]
		, [DateTime]
		, InsertionItemId		
		, ProductionQuantity
		, WasteQuantity
		, [RowVersion]
	FROM 
		[dbo].[InventoryUsageItems];	
END
GO