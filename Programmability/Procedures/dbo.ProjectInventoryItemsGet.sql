﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectInventoryItemsGet]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		PROJECTINVENTORYITEM_ID
		, PROJECTINVENTORYITEM_ITEMID
		, PROJECTINVENTORYITEM_PROJECTID
	FROM 
		[dbo].[ProjectInventoryItems]
	ORDER BY
		PROJECTINVENTORYITEM_ID;
END
GO