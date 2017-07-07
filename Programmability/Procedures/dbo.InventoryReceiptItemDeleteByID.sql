SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryReceiptItemDeleteByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
		
	DELETE 
		[dbo].[InventoryReceiptItems] 	
	WHERE 
		INVENTORYRECEIPTITEM_ID = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0
	ELSE
		RETURN 1
END
GO