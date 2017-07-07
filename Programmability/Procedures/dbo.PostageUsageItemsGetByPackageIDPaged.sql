﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageUsageItemsGetByPackageIDPaged] 
	@ID				int,
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DECLARE @StartRow int,
		@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY POSTAGEUSAGEITEM_ID DESC) AS ResultNum, 
			POSTAGEUSAGEITEM_ID
			, POSTAGEUSAGEITEM_DATETIME			
			, POSTAGEUSAGEITEM_PACKAGEID
			, POSTAGEUSAGEITEM_QUANTITY
			, POSTAGEUSAGEITEM_RATE
			, POSTAGEUSAGEITEM_ROWVERSION
		FROM [dbo].[PostageUsageItems]
		WHERE POSTAGEUSAGEITEM_ID IN (
			SELECT 
				POSTAGEUSAGEITEM_ID 
			FROM 
				[dbo].[InventoryUsageItems]				
			WHERE 
				POSTAGEUSAGEITEM_PACKAGEID = @ID))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;			
END
GO