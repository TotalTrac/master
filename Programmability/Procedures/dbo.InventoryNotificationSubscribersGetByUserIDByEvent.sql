﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[InventoryNotificationSubscribersGetByUserIDByEvent]
	@ID			int
	, @Event	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		INVENTORYNOTIFICATIONSUBSCRIBER_ID
		, INVENTORYNOTIFICATIONSUBSCRIBER_EVENTS
		, INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID
		, INVENTORYNOTIFICATIONSUBSCRIBER_USERID
	FROM
		[dbo].[InventoryNotificationSubscribers]
	WHERE 
		INVENTORYNOTIFICATIONSUBSCRIBER_USERID = @ID
		AND (INVENTORYNOTIFICATIONSUBSCRIBER_EVENTS & @Event) > 0
	ORDER BY 
		INVENTORYNOTIFICATIONSUBSCRIBER_ID;
END
GO