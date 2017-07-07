SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InsertionItemsGetByJobID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT  
		i.ID
		, i.FACESFLAP
		, i.INVENTORYITEMID
		, i.KitId
    , i.Name
		, i.WASTEPERCENT
		, i.WASTEPERRUN
		, i.ZINDEX
		, i.[ROWVERSION]
	FROM 
		job.[InsertionItems] as i
		INNER JOIN [job].kits as k
			ON i.KITID = k.id
	WHERE 
		k.JobId = @ID
	ORDER BY
		i.ID;	
END
GO