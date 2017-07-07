﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryReceiptsGetByClientIDPaged] 
	@ID				int
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DECLARE @StartRow int,
		@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY INVENTORYRECEIPT_ID DESC, INVENTORYRECEIPT_RECEIVED DESC) AS ResultNum, 
			INVENTORYRECEIPT_ID,			
			INVENTORYRECEIPT_CREATED,
			INVENTORYRECEIPT_CREATEDBYID
			INVENTORYRECEIPT_DESCRIPTION,			
			INVENTORYRECEIPT_RECEIVED,
			INVENTORYRECEIPT_RECEIVEDBY,		
			INVENTORYRECEIPT_SHIPCOMPANY,
			INVENTORYRECEIPT_SUPPLIERCOMPANY,			
			INVENTORYRECEIPT_ROWVERSION
		FROM 
			[dbo].[InventoryReceipts]
      
		WHERE INVENTORYRECEIPT_ID IN (
			SELECT 
				r.INVENTORYRECEIPT_ID
			FROM 
				[dbo].[InventoryReceipts] AS r
        INNER JOIN dbo.InventoryReceiptItems iri ON iri.INVENTORYRECEIPTITEM_RECEIPTID = INVENTORYRECEIPT_ID
				INNER JOIN [dbo].[InventoryItems] AS i
					ON iri.INVENTORYRECEIPTITEM_ITEMID = i.[ID]
			WHERE 
				i.[ClientID] = @ID))		
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;	
END
GO