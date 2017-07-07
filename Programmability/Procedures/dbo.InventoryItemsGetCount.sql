SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetCount] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT([ID]) 
	FROM 
		[dbo].[InventoryItems];
END
GO