SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetByClientIDsPaged]
	@IDs			varchar(100),
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
			ROW_NUMBER() OVER (ORDER BY i.[ID] DESC) AS ResultNum, 
			i.[ID]
			, i.[ClientID]
			, i.[Code]
			, i.[Created]
			, i.[CreatedByID]
			, i.[Depth]
			, i.[Description]
			, i.FeedType
			, i.[Height]
			, i.[IsActive]
			, i.IsPinless
      , i.NotificationTypeId
			, i.[PaperColor]
			, i.[PaperTypeId]
			, i.[PaperWeight]
			, i.[ReorderThreshold]
			, i.[ReorderThresholdTypeID]
      , i.[ShareTypeId]
			, i.[SheetHeight]
			, i.[SheetPagesHorizontal]
			, i.[SheetPagesVertical]
			, i.[SheetWidth]
			, i.[TypeID]
			, i.[WastePercentage]
			, i.[WastePerRun]
			, i.[Weight]
			, i.[Width]
			, i.[RowVersion]		
		FROM [dbo].[InventoryItems] AS i
		WHERE i.[ID] IN (
			SELECT
				ii.[ID]
			FROM 
				[dbo].[InventoryItems] AS ii
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON ii.[ClientID] = i.number
			))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO