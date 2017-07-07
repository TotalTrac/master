SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SignoffItemsGet] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT
		ID
		, COPIES
		, KitId
    , Instructions
		, QUANTITY
		, Random
    ,SoDueDate
		, [ROWVERSION]
	FROM 
		job.[SignoffItems]
	ORDER BY
		ID;
END
GO