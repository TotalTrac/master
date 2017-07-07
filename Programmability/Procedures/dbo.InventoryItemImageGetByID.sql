﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemImageGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT
		INVENTORYITEMIMAGE_ID
		, INVENTORYITEMIMAGE_CONTENTTYPE
		, INVENTORYITEMIMAGE_DATA
		, INVENTORYITEMIMAGE_FILEEXTENSION
		, INVENTORYITEMIMAGE_INDEX
		, INVENTORYITEMIMAGE_INVENTORYITEMID
		, INVENTORYITEMIMAGE_ISTHUMBNAIL
	FROM
		[dbo].[InventoryItemImages]
	WHERE
		INVENTORYITEMIMAGE_ID = @ID;
END
GO