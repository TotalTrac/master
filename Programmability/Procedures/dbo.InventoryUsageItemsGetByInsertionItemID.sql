SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemsGetByInsertionItemID]
	@ID	int
	, @From datetime = NULL
	, @To	datetime = NULL
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		u.[Id]
		, u.[DateTime]
		, u.InsertionItemId		
		, u.ProductionQuantity
		, u.WasteQuantity
		, u.[RowVersion]
	FROM 
		[dbo].[InventoryUsageItems] AS u		
	WHERE
		u.InsertionItemId = @ID
		AND (@From IS NULL OR u.[DateTime] >= @From)
		AND (@To IS NULL OR u.[DateTime] <= @To);
		
		
END
GO