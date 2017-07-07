SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptUpdate] 
	@ID					int	
	, @Created			datetime
	, @CreatedByID		int
	, @Description		nvarchar(200) = NULL

	, @Received			datetime
	, @ReceivedBy		nvarchar(50)
	, @ShipCompany		nvarchar(50)
	, @SupplierCompany	nvarchar(50)	
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[InventoryReceipts]
	SET		
		INVENTORYRECEIPT_CREATED				= @Created
		, INVENTORYRECEIPT_CREATEDBYID			= @CreatedByID
		, INVENTORYRECEIPT_DESCRIPTION			= @Description
		, INVENTORYRECEIPT_RECEIVED				= @Received				
		, INVENTORYRECEIPT_RECEIVEDBY			= @ReceivedBy
		, INVENTORYRECEIPT_SHIPCOMPANY			= @ShipCompany		
		, INVENTORYRECEIPT_SUPPLIERCOMPANY		= @SupplierCompany
	OUTPUT
		inserted.INVENTORYRECEIPT_ID AS ID, inserted.INVENTORYRECEIPT_ROWVERSION AS [VERSION]
	WHERE 
		(INVENTORYRECEIPT_ID = @ID) 
		AND (INVENTORYRECEIPT_ROWVERSION = @Version);	
END
GO