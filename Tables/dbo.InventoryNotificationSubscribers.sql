﻿CREATE TABLE [dbo].[InventoryNotificationSubscribers] (
  [INVENTORYNOTIFICATIONSUBSCRIBER_ID] [int] IDENTITY,
  [INVENTORYNOTIFICATIONSUBSCRIBER_EVENTS] [int] NOT NULL,
  [INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID] [int] NOT NULL,
  [INVENTORYNOTIFICATIONSUBSCRIBER_USERID] [int] NOT NULL,
  CONSTRAINT [PK_UserInventoryItemNotifications] PRIMARY KEY CLUSTERED ([INVENTORYNOTIFICATIONSUBSCRIBER_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_UserInventoryItemNotifications_InventoryItemID]
  ON [dbo].[InventoryNotificationSubscribers] ([INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_UserInventoryItemNotifications_Uniqueness]
  ON [dbo].[InventoryNotificationSubscribers] ([INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID], [INVENTORYNOTIFICATIONSUBSCRIBER_USERID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_UserInventoryItemNotifications_UserID]
  ON [dbo].[InventoryNotificationSubscribers] ([INVENTORYNOTIFICATIONSUBSCRIBER_USERID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryNotificationSubscribers]
  ADD CONSTRAINT [FK_UserInventoryItemNotifications_InventoryItems] FOREIGN KEY ([INVENTORYNOTIFICATIONSUBSCRIBER_INVENTORYITEMID]) REFERENCES [dbo].[InventoryItems] ([ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[InventoryNotificationSubscribers]
  ADD CONSTRAINT [FK_UserInventoryItemNotifications_Users] FOREIGN KEY ([INVENTORYNOTIFICATIONSUBSCRIBER_USERID]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO