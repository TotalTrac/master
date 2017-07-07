SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[InsertionItemDeleteById] 
	@ID int
AS
BEGIN
	DECLARE @SegmentID	int;
	SELECT @SegmentID = ITEM_SEGMENTID FROM [usps].[InsertionItems] WHERE ITEM_ID = @ID;
	
	DELETE 
		[usps].[InsertionItems] 
	WHERE 
		ITEM_ID = @ID;

	IF @@ROWCOUNT > 0
		BEGIN
			UPDATE items
			SET
				ITEM_INDEX = NEW_INDEX
			FROM
			(
				SELECT  
					ITEM_INDEX, ROW_NUMBER() OVER(ORDER BY ITEM_INDEX) - 1 AS NEW_INDEX
				FROM
					[usps].[InsertionItems]
				WHERE
					ITEM_SEGMENTID = @SegmentID
			) AS items;

			RETURN 0;
		END
	ELSE
		RETURN 1;
END
GO