SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemCreate] 
	
	@InsertionItemId	int
	, @InventoryItemId	int
  , @AffixinglocationTypeId int
	, @TypeId			int
	, @Size				nvarchar(50)
	, @StampTypeId		int
	, @Description		nvarchar(max)
	, @Up				int
	, @Tabs				int
	, @TabTypeId		int
	, @XBaseline		int
	, @XOffset			decimal(5, 2)
	, @YBaseline		INT
  ,@StartTime DATETIME = NULL
  ,@EndTime DATETIME = NULL
	, @TabbedEdges		int
	, @YOffset			decimal(5, 2)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	INSERT job.AffixingItems
	(
		INSERTITEMID
		, INVENTORYITEMID
		, AFFIXINGLOCATIONTYPEID
		, [DESCRIPTION]
		, SIZE
		, STAMPTYPEID
		, TABS
		, TABTYPEID
		, TYPEID
		, UP
		, XBASELINE
		, XOFFSET
		, YBASELINE
		, TABBEDEDGES
		, YOFFSET
    , StartTime
    , EndTime
	)
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(
		@InsertionItemId
		, @InventoryItemId
		, @AffixingLocationTypeId
		, @Description
		, @Size
		, @StampTypeId
		, @Tabs
		, @TabTypeId
		, @TypeId
		, @Up
		, @XBaseline
		, @XOffset
		, @YBaseline
		, @TabbedEdges
		, @YOffset
    , @StartTime
    , @EndTime
	);
END
GO