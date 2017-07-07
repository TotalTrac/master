SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryItemsGetByTextSearchCode]
	@Substring VARCHAR(255)
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
		CONTAINS(Code,@Substring)
END
GO