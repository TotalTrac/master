SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[InsertionItemCreate]
	@Index				int
	, @InventoryItemID	int	
	, @SegmentID		int
AS

BEGIN
		
	SET NOCOUNT ON;

	SET XACT_ABORT ON;

	BEGIN TRANSACTION t1

		UPDATE [usps].[InsertionItems]
		SET
			ITEM_INDEX = ITEM_INDEX + 1	
		WHERE
			ITEM_SEGMENTID = @SegmentID
			AND ITEM_INDEX >= @Index;	
			
		INSERT [usps].[InsertionItems]	
		(
			ITEM_INDEX
			, ITEM_INVENTORYITEMID
			, ITEM_SEGMENTID
		)
		OUTPUT
			inserted.ITEM_ID AS ID, inserted.ITEM_ROWVERSION AS [VERSION]
		VALUES
		(
			@Index
			, @InventoryItemID
			, @SegmentID
		);

	COMMIT TRANSACTION t1;
END
GO