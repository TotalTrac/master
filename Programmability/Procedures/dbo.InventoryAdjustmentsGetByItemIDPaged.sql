SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryAdjustmentsGetByItemIDPaged] 
	@ID				int,
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DECLARE @StartRow int,
		@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY ADJUSTMENT_ID DESC, ADJUSTMENT_CREATED DESC) AS ResultNum, 
			ADJUSTMENT_ID
			, ADJUSTMENT_ADJUSTMENT
			, ADJUSTMENT_CREATED
			, ADJUSTMENT_CREATEDBYID
			, ADJUSTMENT_DESCRIPTION			
			, ADJUSTMENT_INVENTORYITEMID
			, ADJUSTMENT_ROWVERSION
		FROM [dbo].[InventoryAdjustments]
		WHERE ADJUSTMENT_ID IN (
			SELECT ADJUSTMENT_ID FROM [dbo].[InventoryAdjustments] 
			WHERE ADJUSTMENT_INVENTORYITEMID = @ID))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;			
END
GO