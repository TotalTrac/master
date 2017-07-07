SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemsGet] 
	
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		* 
	FROM 
		job.FoldingItems
	ORDER BY
		ID;
		
END
GO