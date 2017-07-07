﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[InsertionItemsGet] 
	
AS
BEGIN

	SET NOCOUNT ON;


	SELECT  
		ID
		, FACESFLAP
		, INVENTORYITEMID
		, KitId
    , Name
		, WASTEPERCENT
		, WASTEPERRUN
		, ZINDEX
		, [ROWVERSION]
	FROM 
		job.[InsertionItems]
	ORDER BY
		ID;
END
GO