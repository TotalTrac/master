SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetByClientIDs]
	@IDs			varchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
    
    SELECT
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
	FROM [dbo].[InventoryItems] AS i
	WHERE 
		i.[ID] IN (
			SELECT
				[ID]
			FROM 
				[dbo].[InventoryItems] AS ii
				INNER JOIN IntegerListToTable(@IDs) AS i 
					ON ii.[ID] = i.number
			);
END
GO