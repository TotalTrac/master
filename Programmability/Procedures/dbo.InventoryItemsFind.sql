SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsFind]	
	@IsActive			bit = NULL
	, @ClientIDs		varchar(100) = NULL	
	, @Description		nvarchar(50) = NULL	
	, @JobGroupIDs		varchar(100) = NULL
	, @Code				nvarchar(50) = NULL
	, @ReorderThreshold	int = NULL
	, @TypeIDs			varchar(100) = NULL	
	, @TypeName			nvarchar(50) = NULL
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
		[dbo].[InventoryItems] AS i
		INNER JOIN [dbo].[InventoryItemTypes] AS it
			ON i.[TypeID] = it.INVENTORYITEMTYPE_ID
		
	WHERE
		(@ClientIDs IS NULL OR @ClientIDs = '' OR [ClientID] IN (
		--(INVENTORYITEM_ID IN (
			SELECT
				ii.[ID]
			FROM 
				[dbo].[InventoryItems] AS ii
				INNER JOIN IntegerListToTable(@ClientIDs) AS i 
					ON ii.[ClientID] = i.number
		))
	AND
		(@TypeIDs IS NULL OR @TypeIDs = '' OR [TypeID] IN (
		SELECT
			ii.[ID]
		FROM 
			[dbo].[InventoryItems] AS ii
			INNER JOIN IntegerListToTable(@TypeIDs) AS i 
				ON ii.[TypeID] = i.number
		))	
	AND
		(@IsActive IS NULL OR [IsActive] = @IsActive)
		AND (@ReorderThreshold IS NULL OR [ReorderThreshold] = @ReorderThreshold)
		AND (@Description IS NULL OR @Description = '' OR [Description] LIKE '%' + @Description + '%')
		AND (@Code IS NULL OR @Code = '' OR [Code] LIKE '%' + @Code + '%')
		AND (@TypeName IS NULL OR @TypeName = '' OR INVENTORYITEMTYPE_NAME LIKE '%' + @TypeName + '%')
END
GO