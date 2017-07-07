SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptItemCreate] 
	@ReceiptID		int,
  @ItemId   INT,
	@ContainerTypeID int,
	@NumContainers	int,
	@PerContainer	int,
	@Note	varchar(max) = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[InventoryReceiptItems]
	(
		INVENTORYRECEIPTITEM_RECEIPTID
		, INVENTORYRECEIPTITEM_CONTAINERTYPEID
		, INVENTORYRECEIPTITEM_CONTAINERS
		, INVENTORYRECEIPTITEM_CONTAINERCOUNT
    , INVENTORYRECEIPTITEM_ITEMID
	, INVENTORYRECEIPTITEM_NOTE
	)
	OUTPUT
		inserted.INVENTORYRECEIPTITEM_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@ReceiptID
		, @ContainerTypeID
		, @NumContainers
		, @PerContainer
    , @ItemId
	, @Note
	);
END
GO