SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemsGetByJobID]
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
		INNER JOIN [job].[InsertionItems] AS i
			ON u.InsertionItemId = i.Id
		INNER JOIN [job].[Kits] AS k
			ON i.KitId = k.Id		
	WHERE
		k.JobId = @ID
		AND (@From IS NULL OR u.[DateTime] >= @From)
		AND (@To IS NULL OR u.[DateTime] <= @To);
		
		
END
GO