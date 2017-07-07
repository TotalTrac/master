SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemSuppliersGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;

    WITH CTE (CLIENT_ID)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)	
	SELECT 
		DISTINCT r.INVENTORYRECEIPT_SUPPLIERCOMPANY
    FROM 
		[dbo].[InventoryReceipts] AS r
    INNER JOIN dbo.InventoryReceiptItems iri ON iri.INVENTORYRECEIPTITEM_RECEIPTID = r.INVENTORYRECEIPT_ID
		INNER JOIN [dbo].[InventoryItems] AS i
			ON iri.INVENTORYRECEIPTITEM_ITEMID = i.[ID]
		INNER JOIN CTE
			ON CTE.CLIENT_ID = [CLIENT_ID]
	WHERE
		r.INVENTORYRECEIPT_SUPPLIERCOMPANY LIKE '%' + @Substring + '%';
END
GO