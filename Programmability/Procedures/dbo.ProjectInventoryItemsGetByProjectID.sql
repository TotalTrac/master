﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ProjectInventoryItemsGetByProjectID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		PROJECTINVENTORYITEM_ID
		, PROJECTINVENTORYITEM_ITEMID
		, PROJECTINVENTORYITEM_PROJECTID
	FROM 
		[dbo].[ProjectInventoryItems]
	WHERE
		PROJECTINVENTORYITEM_PROJECTID = @ID
	ORDER BY
		PROJECTINVENTORYITEM_ID;
END
GO