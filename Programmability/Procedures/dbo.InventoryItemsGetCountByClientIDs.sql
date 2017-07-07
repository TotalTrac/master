SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetCountByClientIDs] 
	@IDs varchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;
	
    SELECT 
		COUNT(ii.ID) 
	FROM 
		[dbo].[InventoryItems] AS ii
		INNER JOIN IntegerListToTable(@IDs) AS i 
			ON ii.ClientID = i.number;	
END
GO