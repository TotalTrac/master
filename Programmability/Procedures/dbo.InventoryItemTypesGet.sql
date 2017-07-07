﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemTypesGet]
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		INVENTORYITEMTYPE_ID		
		, INVENTORYITEMTYPE_ISCONTAINER
		, INVENTORYITEMTYPE_ISSELFMAILER
		, INVENTORYITEMTYPE_NAME
	FROM
		[dbo].[InventoryItemTypes];
END
GO