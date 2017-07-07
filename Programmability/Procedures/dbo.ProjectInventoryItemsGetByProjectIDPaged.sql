SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ProjectInventoryItemsGetByProjectIDPaged] 
	@ID				int
	, @Page			int
	, @RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT 
		* 
	FROM 
	(
		SELECT ROW_NUMBER() OVER (ORDER BY PROJECTINVENTORYITEM_ID) AS ResultNum 
			, PROJECTINVENTORYITEM_ID
			, PROJECTINVENTORYITEM_ITEMID
			, PROJECTINVENTORYITEM_PROJECTID
	FROM 
		[dbo].[ProjectInventoryItems]
	WHERE
		PROJECTINVENTORYITEM_PROJECTID = @ID
	) AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO