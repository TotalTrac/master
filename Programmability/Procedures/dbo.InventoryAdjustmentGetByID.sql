﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryAdjustmentGetByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		ADJUSTMENT_ID
		, ADJUSTMENT_ADJUSTMENT
		, ADJUSTMENT_CREATED
		, ADJUSTMENT_CREATEDBYID
		, ADJUSTMENT_DESCRIPTION			
		, ADJUSTMENT_INVENTORYITEMID
		, ADJUSTMENT_ROWVERSION		
	FROM 
		[dbo].[InventoryAdjustments]
	WHERE 
		ADJUSTMENT_ID = @ID;
		
END
GO