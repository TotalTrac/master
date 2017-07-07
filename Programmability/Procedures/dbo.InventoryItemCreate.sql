SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemCreate] 
	@ClientId					int	
    , @Code						nvarchar(50)
	, @Created					datetime
	, @CreatedById				int
	, @Depth					decimal(7,4) = NULL
	, @Description				nvarchar(100)	
	, @Height					decimal(7,4) = NULL
	, @FeedType					int
	, @IsActive					bit
	, @IsPinless				bit
	, @NotificationTypeId		int = NULL
	, @PaperColor				varchar(100) = NULL
	, @PaperTypeId				int = null
	, @PaperWeight				int = null
	, @ReorderThreshold			int = NULL
	, @ReorderThresholdTypeId	int = NULL
	, @ShareTypeId				int = NULL
    , @SheetHeight				decimal(7,4) = NULL
    , @SheetPagesHorizontal		int = NULL
    , @SheetPagesVertical		int = NULL
    , @SheetWidth				decimal(7,4) = NULL
	, @TypeId					int
	, @WastePercentage			float = NULL
	, @WastePerRun				int = NULL
	, @Weight					decimal(7,4) = NULL
	, @Width					decimal(7,4) = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[InventoryItems]
	(
		[ClientID]
		, [Code]
		, [Created]
		, [CreatedByID]
		, [Depth]
		, [Description]
		, [Height]
		, [FeedType]
		, [IsActive]
		, [IsPinless]
		, [NotificationTypeId]
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
	) 
	OUTPUT
		inserted.[ID] AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES 
	(		
		@ClientId
		, @Code
		, @Created
		, @CreatedById
		, @Depth
		, @Description
		, @Height
		, @FeedType		
		, @IsActive		
		, @IsPinless
		, @NotificationTypeId
		, @PaperColor
		, @PaperTypeId
		, @PaperWeight
		, @ReorderThreshold
		, @ReorderThresholdTypeId
		, @ShareTypeId
		, @SheetHeight
		, @SheetPagesHorizontal
		, @SheetPagesVertical
		, @SheetWidth
		, @TypeId
		, @WastePercentage
		, @WastePerRun
		, @Weight
		, @Width
	);
END
GO