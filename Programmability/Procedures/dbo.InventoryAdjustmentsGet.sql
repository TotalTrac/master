﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryAdjustmentsGet] 
	
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
	ORDER BY 
		ADJUSTMENT_ID;
END
GO