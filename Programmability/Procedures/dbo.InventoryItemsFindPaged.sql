SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsFindPaged]
	@Page				int
	, @RowsPerPage		int
	, @SortColumn		int = 0	
	, @Active			bit = NULL
	, @ClientIDs		varchar(100) = NULL	
	, @Description		nvarchar(50) = NULL	
	, @JobGroupIDs		varchar(100) = NULL
	, @Code				nvarchar(50) = NULL
	, @ReorderThreshold	int = NULL
	, @TypeIDs			varchar(100) = NULL
	, @TypeName			nvarchar(50) = NULL	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
		
	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY i.[ID]) AS ResultNum 		
			, i.[ID]
			, i.[ClientID]
			, i.[Code]
			, i.[Created]
			, i.[CreatedByID]
			, i.[Depth]
			, i.[Description]
			, i.[Height]
			, i.[IsActive]
			, i.IsPinless
      , i.NotificationTypeId
			, i.[PaperColor]
			, i.[PaperTypeId]
			, i.[PaperWeight]
			, i.[ReorderThreshold]
			, i.[ReorderThresholdTypeID]
      , i.[ShareTypeId]
			, i.[SheetHeight]
			, i.[SheetPagesHorizontal]
			, i.[SheetPagesVertical]
			, i.[SheetWidth]
			, i.[TypeID]
			, i.[WastePercentage]
			, i.[WastePerRun]
			, i.[Weight]
			, i.[Width]
			, i.[RowVersion]
		FROM 
			[dbo].[InventoryItems] AS i
			INNER JOIN [dbo].[InventoryItemTypes] AS it
				ON i.[TypeID] = it.INVENTORYITEMTYPE_ID
		WHERE
			(@ClientIDs IS NULL OR @ClientIDs = '' OR [ID] IN (			
				SELECT
					ii.[ID]
				FROM 
					[dbo].[InventoryItems] AS ii
					INNER JOIN IntegerListToTable(@ClientIDs) AS i 
						ON ii.[ClientID] = i.number
			))
		AND
			(@TypeIDs IS NULL OR @TypeIDs = '' OR i.[ID] IN (
				SELECT
					ii.[ID]
				FROM 
					[dbo].[InventoryItems] AS ii
					INNER JOIN IntegerListToTable(@TypeIDs) AS i 
						ON ii.[TypeID] = i.number
			))		
		AND
			(@Active IS NULL OR i.[IsActive] = @Active)
			 AND (@ReorderThreshold IS NULL OR i.[ReorderThreshold] = @ReorderThreshold)
			 AND (@Description IS NULL OR @Description = '' OR i.[Description] LIKE '%' + @Description + '%')
			 AND (@Code IS NULL OR @Code = '' OR i.[Code] LIKE '%' + @Code + '%')
			 AND (@TypeName IS NULL OR @TypeName = '' OR INVENTORYITEMTYPE_NAME LIKE '%' + @TypeName + '%')
		) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;		
END
GO