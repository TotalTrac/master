SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemExists]
	@ClientID		int		
	, @TypeID		int
	, @Code	nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	IF EXISTS(SELECT [ID] FROM [dbo].[InventoryItems] 
				WHERE (([Code] = @Code)
				AND ([TypeID] = @TypeID)
				AND ([ClientID] = @ClientID)))
		RETURN 1;
	ELSE
		RETURN 0;
END
GO