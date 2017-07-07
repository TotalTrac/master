SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemGetByID]
	@ID int
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
		[dbo].[InventoryUsageItems] 
	WHERE 
		[Id] = @ID;
END
GO