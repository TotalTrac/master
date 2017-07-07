CREATE TABLE [dbo].[WarehouseLocationInventoryItems] (
  [LOCATIONITEM_ID] [int] IDENTITY,
  [LOCATIONITEM_INVENTORYITEMID] [int] NOT NULL CONSTRAINT [DF_tblWarehouseLocationInventoryItems_WAREHOUSELOCATIONITEM_INVENTORYITEMID] DEFAULT (0),
  [LOCATIONITEM_LOCATIONID] [int] NOT NULL,
  [LOCATIONITEM_QUANTITY] [int] NOT NULL,
  [LOCATIONITEM_ROWVERSION] [timestamp],
  CONSTRAINT [PK_WarehouseLocationItems] PRIMARY KEY CLUSTERED ([LOCATIONITEM_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_WarehouseLocationInventoryItems]
  ON [dbo].[WarehouseLocationInventoryItems] ([LOCATIONITEM_INVENTORYITEMID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_WarehouseLocationInventoryItems_1]
  ON [dbo].[WarehouseLocationInventoryItems] ([LOCATIONITEM_LOCATIONID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[WarehouseLocationInventoryItems]
  ADD CONSTRAINT [FK_WarehouseLocationInventoryItems_InventoryItems] FOREIGN KEY ([LOCATIONITEM_INVENTORYITEMID]) REFERENCES [dbo].[InventoryItems] ([ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[WarehouseLocationInventoryItems]
  ADD CONSTRAINT [FK_WarehouseLocationInventoryItems_WarehouseLocations] FOREIGN KEY ([LOCATIONITEM_LOCATIONID]) REFERENCES [dbo].[WarehouseLocations] ([LOCATION_ID]) ON DELETE CASCADE
GO