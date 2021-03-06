﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[InsertionItemsGetByInventoryItemID]
	@ID		int

AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ITEM_ID
		, ITEM_INDEX
		, ITEM_INVENTORYITEMID
		, ITEM_SEGMENTID
		, ITEM_ROWVERSION
	FROM 
		[usps].[InsertionItems]
	WHERE
		ITEM_INVENTORYITEMID = @ID;
END
GO