SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectInventoryItemCreate] 		
	@ItemID			int
	, @ProjectID	int	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[ProjectInventoryItems]
	(
		PROJECTINVENTORYITEM_ITEMID
		, PROJECTINVENTORYITEM_PROJECTID
	) 
	OUTPUT		
		inserted.PROJECTINVENTORYITEM_ID AS ID, NULL AS [VERSION]
	VALUES 
	(
		@ItemID
		, @ProjectID
	);	
END
GO