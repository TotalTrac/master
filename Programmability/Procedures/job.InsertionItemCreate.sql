SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InsertionItemCreate] 
	@KitID			int
	, @FacesFlap		bit
	, @InventoryItemID	int	
  , @Name             varchar(100)
	, @WastePercentage	float = NULL
	, @WastePerRun		int = NULL
	, @ZIndex			int
AS

BEGIN
	
	SET NOCOUNT ON;
	
	INSERT job.[InsertionItems]
	(
		KITID
		, FACESFLAP
		, INVENTORYITEMID	
    , Name	
		, WASTEPERCENT
		, WASTEPERRUN
		, ZINDEX
	)
	OUTPUT
		inserted.ID AS ID, inserted.ROWVERSION AS [VERSION]
	VALUES
	(
		@KitID
		, @FacesFlap
		, @InventoryItemID		
    , @Name
		, @WastePercentage
		, @WastePerRun
		, @ZIndex
	);
END
GO