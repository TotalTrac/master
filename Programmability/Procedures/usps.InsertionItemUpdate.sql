SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[InsertionItemUpdate]
	@ID					int
	, @Index			int
	, @InventoryItemID	int	
	, @SegmentID		int
	, @Version			timestamp
AS

BEGIN
		
	SET NOCOUNT ON;

	SET XACT_ABORT ON;

	BEGIN TRANSACTION t1

		-- We need to know if we are moving up or down
		DECLARE @Direction int
		SELECT @Direction = 
			CASE 
				WHEN ITEM_INDEX > @Index THEN -1 
				WHEN ITEM_INDEX < @Index THEN 1
				ELSE 0 
			END 
		FROM 
			[usps].[InsertionItems] 
		WHERE 
			ITEM_ID = @ID 
			AND ITEM_ROWVERSION = @Version;
		
		-- Update item
		UPDATE [usps].[InsertionItems]		
		SET
			ITEM_INDEX				= @Index
			, ITEM_INVENTORYITEMID	= @InventoryItemID
			, ITEM_SEGMENTID		= @SegmentID
		OUTPUT
			inserted.ITEM_ID AS ID, inserted.ITEM_ROWVERSION AS [VERSION]
		WHERE
			ITEM_ID = @ID
			AND ITEM_ROWVERSION = @Version;
	
		-- Move his homies around
		IF @@ROWCOUNT > 0 AND @Direction <> 0
			BEGIN
				
				UPDATE segmentItems
				SET
					ITEM_INDEX = 
						CASE WHEN ITEM_ID = @ID THEN @Index
							 ELSE
							    CASE WHEN ITEM_INDEX = @Index THEN ITEM_INDEX - @Direction
									 ELSE ITEM_NEWINDEX
								END
						END
				FROM
				(	
					SELECT
						ITEM_ID
						, ITEM_INDEX
						, ROW_NUMBER() OVER (ORDER BY ITEM_INDEX) - 1 AS ITEM_NEWINDEX
					FROM
						[usps].[InsertionItems]
					WHERE
						ITEM_SEGMENTID = @SegmentID						
				) AS segmentItems
			END
	
	COMMIT TRANSACTION t1;
END
GO