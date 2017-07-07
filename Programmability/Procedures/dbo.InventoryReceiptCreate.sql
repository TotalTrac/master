SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptCreate] 
	@Created			datetime
	, @CreatedByID		int	
	, @Description		nvarchar(200) = NULL
	
	, @Received			datetime
	, @ReceivedBy		nvarchar(50)
	, @ShipCompany		nvarchar(50)
	, @SupplierCompany	nvarchar(50)		
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[InventoryReceipts]
	(	
		INVENTORYRECEIPT_CREATED
		, INVENTORYRECEIPT_CREATEDBYID
		, INVENTORYRECEIPT_DESCRIPTION
				
		, INVENTORYRECEIPT_RECEIVED
		, INVENTORYRECEIPT_RECEIVEDBY
		, INVENTORYRECEIPT_SHIPCOMPANY		
		, INVENTORYRECEIPT_SUPPLIERCOMPANY		
	)
	OUTPUT
		inserted.INVENTORYRECEIPT_ID AS ID, inserted.INVENTORYRECEIPT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Created
		, @CreatedByID
		, @Description
		, @Received
		, @ReceivedBy
		, @ShipCompany		
		, @SupplierCompany		
	);
END
GO