SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetByUserID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)
	SELECT
		[ID]
		, [ClientID]
		, [Code]
		, [Created]
		, [CreatedByID]
		, [Depth]
		, [Description]
		, FeedType
		, [Height]
		, [IsActive]
		, IsPinless
    , NotificationTypeId
		, [PaperColor]
		, [PaperTypeId]
		, [PaperWeight]
		, [ReorderThreshold]
		, [ReorderThresholdTypeID]
    , [i].[ShareTypeId]
		, [SheetHeight]
		, [SheetPagesHorizontal]
		, [SheetPagesVertical]
		, [SheetWidth]
		, [TypeID]
		, [WastePercentage]
		, [WastePerRun]
		, [Weight]
		, [Width]
		, [RowVersion]
	FROM
		[dbo].[InventoryItems] AS i
		INNER JOIN CTE AS c
			ON i.[ClientID] = c.CLIENT_ID
END
GO