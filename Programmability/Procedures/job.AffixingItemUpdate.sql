SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
  CREATE PROCEDURE [job].[AffixingItemUpdate] 
	@ID					INT
  ,@AffixingLocationTypeId int
	, @InsertionItemId	int
	, @InventoryItemId	int
	, @TypeId			int
	, @Size				nvarchar(50)
	, @StampTypeId		int
	, @Description		nvarchar(max)
	, @Up				int
	, @Tabs				int
	, @TabTypeId		int
	, @XBaseline		int
	, @XOffset			decimal(5, 2)
	, @YBaseline		int
	, @YOffset			decimal(5, 2)
    ,@StartTime DATETIME = NULL
  ,@EndTime DATETIME = NULL
	, @TabbedEdges		int
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE job.[AffixingItems]
	SET
		INSERTITEMID	= @InsertionItemId
    ,AffixingLocationTypeId = @AffixingLocationTypeId
		, INVENTORYITEMID	= @InventoryItemId
		, [DESCRIPTION]	= @Description
		, SIZE			= @Size
		, STAMPTYPEID	= @StampTypeId
		, TABS			= @Tabs
		, TABTYPEID	= @TabTypeId
		, TYPEID		= @TypeId
		, UP			= @Up
    , StartTime = @StartTime
    , EndTime = @EndTime
		, XBASELINE	= @XBaseline
		, XOFFSET		= @XOffset
		, YBASELINE	= @YBaseline
		, YOFFSET		= @YOffset
		, TABBEDEDGES	= @TabbedEdges
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	WHERE
		(ID = @ID)
		AND ([ROWVERSION] = @Version);
END
GO