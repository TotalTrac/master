﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryUsageItemsGetByInsertionItemIDPaged]
	@ID	int
	, @From datetime = NULL
	, @To	datetime = NULL
	, @PageSize		int
	, @PageNumber	int
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
		AND (@To IS NULL OR u.[DateTime] <= @To)
	ORDER BY 
		CASE WHEN @From IS NULL AND @To IS NULL
			THEN u.[Id] 
		END,
		CASE WHEN @From IS NOT NULL OR @To IS NOT NULL
			THEN u.[DateTime] 
		END
		OFFSET @PageSize * (@PageNumber - 1) ROWS
			FETCH NEXT @PageSize ROWS ONLY;
		
END
GO