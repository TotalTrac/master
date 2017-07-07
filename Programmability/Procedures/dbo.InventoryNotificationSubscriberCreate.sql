﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryNotificationSubscriberCreate] 	
	@EventID	int
	, @ItemID	int
	, @UserID	int
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[InventoryNotificationSubscribers]
	(		
		INVENTORYNOTIFICATIONSUBSCRIBER_EVENTS
		, INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID
		, INVENTORYNOTIFICATIONSUBSCRIBER_USERID
	)
	OUTPUT
		inserted.INVENTORYNOTIFICATIONSUBSCRIBER_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@EventID
		, @ItemID
		, @UserID
	);
END
GO