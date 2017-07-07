SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetByClientIDPaged]
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
		
	SELECT
		* 
	FROM 
	(
		SELECT
			ROW_NUMBER() OVER (ORDER BY [ID] DESC) AS ResultNum, 
			[ID]
			, [ClientID]
			, [Code]
			, [Created]
			, [CreatedByID]
			, [Depth]
			, [Description]
			, FeedType
			, [Height]
			, [IsActive]
			, IsPinless
      , NotificationTypeId
			, [PaperColor]
			, [PaperTypeId]
			, [PaperWeight]
			, [ReorderThreshold]
			, [ReorderThresholdTypeID]
      , [ShareTypeId]
			, [SheetHeight]
			, [SheetPagesHorizontal]
			, [SheetPagesVertical]
			, [SheetWidth]
			, [TypeID]
			, [WastePercentage]
			, [WastePerRun]
			, [Weight]
			, [Width]
			, [RowVersion]
		FROM [dbo].[InventoryItems]
		WHERE [ID] 
		IN 
		(
			SELECT
				[ID]
			FROM 
				[dbo].[InventoryItems]
			WHERE
				[ClientID] = @ID			
		)
	)
	AS NumberResults
	WHERE 
		ResultNum BETWEEN @StartRow AND @EndRow		
END
GO