SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetCountByClientID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 
		COUNT([ID]) 
	FROM 
		[dbo].[InventoryItems]
	WHERE
		([ClientID] = @ID);
END
GO