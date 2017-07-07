SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetByClientIDByTypeID] 
	@ClientID	int
	, @TypeID	int
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
	FROM
		[dbo].[InventoryItems]
	WHERE 
		(([ClientID] = @ClientID) 
		AND ([TypeID] = @TypeID))
END
GO