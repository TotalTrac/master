SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemsGetByInsertItemID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		* 
	FROM 
		job.FoldingItems 
	WHERE 
		INSERTITEMID = @ID
	ORDER BY
		ID;
		
END
GO