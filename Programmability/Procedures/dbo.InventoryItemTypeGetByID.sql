﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemTypeGetByID]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT
		INVENTORYITEMTYPE_ID		
		, INVENTORYITEMTYPE_ISCONTAINER
		, INVENTORYITEMTYPE_ISSELFMAILER
		, INVENTORYITEMTYPE_NAME
	FROM 
		[dbo].[InventoryItemTypes]
	WHERE 
		INVENTORYITEMTYPE_ID = @ID;
END
GO