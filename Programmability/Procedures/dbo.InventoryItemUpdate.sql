SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemUpdate] 	
	@ID							int	
	, @ClientId					int	
    , @Code						nvarchar(50)
	, @Created					datetime
	, @CreatedById				int
	, @Depth					decimal(7,4) = NULL
	, @Description				nvarchar(100)	
	, @Height					decimal(7,4) = NULL
	, @FeedType					int
	, @IsActive					bit
	, @IsPinless				BIT
	, @NotificationTypeId		INT = NULL
	, @PaperColor				varchar(100) = NULL
	, @PaperTypeId				int = null
	, @PaperWeight				int = null
	, @ReorderThreshold			int = NULL
	, @ReorderThresholdTypeId	int = NULL
	, @ShareTypeId				INT = NULL
    , @SheetHeight				decimal(7,4) = NULL
    , @SheetPagesHorizontal		int = NULL
    , @SheetPagesVertical		int = NULL
    , @SheetWidth				decimal(7,4) = NULL
	, @TypeId					int
	, @WastePercentage			float = NULL
	, @WastePerRun				int = NULL
	, @Weight					decimal(7,4) = NULL
	, @Width					decimal(7,4) = NULL
	, @Version					timestamp
AS
BEGIN

	SET NOCOUNT ON;
		
	UPDATE 
		[dbo].[InventoryItems]
	SET		
		[ClientID]					= @ClientId	
		, [Code]					= @Code
		, [Created]					= @Created
		, [CreatedByID]				= @CreatedById	
		, [Depth]					= @Depth
		, [Description]				= @Description		
		, FeedType					= @FeedType
		, [Height]					= @Height
		, [IsActive]				= @IsActive	
		, IsPinless					= @IsPinless
    , NotificationTypeId = @NotificationTypeId
		, [PaperColor]				= @PaperColor
		, [PaperTypeId]				= @PaperTypeId
		, [PaperWeight]				= @PaperWeight
		, [ReorderThreshold]		= @ReorderThreshold
		, [ReorderThresholdTypeID]	= @ReorderThresholdTypeId
    , ShareTypeId             =@ShareTypeId
		, [SheetHeight]				= @SheetHeight
		, [SheetPagesHorizontal]	= @SheetPagesHorizontal
		, [SheetPagesVertical]		= @SheetPagesVertical
		, [SheetWidth]				= @SheetWidth
		, [TypeID]					= @TypeId
		, [WastePercentage]			= @WastePercentage
		, [WastePerRun]				= @WastePerRun
		, [Weight]					= @Weight
		, [Width]					= @Width
	OUTPUT
		inserted.[ID]			AS ID
		, inserted.[RowVersion] AS [VERSION]
	WHERE 
		[ID] = @ID
		AND [RowVersion] = @Version;
END
GO