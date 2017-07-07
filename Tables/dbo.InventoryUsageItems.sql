CREATE TABLE [dbo].[InventoryUsageItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [DateTime] [datetime] NOT NULL,
  [InsertionItemId] [int] NOT NULL CONSTRAINT [DF_tblInventoryUsageItems_INVENTORYUSAGEITEM_INVENTORYITEMID] DEFAULT (0),
  [ProductionQuantity] [int] NOT NULL CONSTRAINT [DF_tblInventoryUsageItems_INVENTORYUSAGEITEM_PRODUCTIONQUANTITY] DEFAULT (0),
  [WasteQuantity] [int] NOT NULL CONSTRAINT [DF_tblInventoryUsageItems_INVENTORYUSAGEITEM_WASTEQUANTITY] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_InventoryUsageItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_InventroyUsageItems_ItemID]
  ON [dbo].[InventoryUsageItems] ([InsertionItemId])
  INCLUDE ([Id], [DateTime], [ProductionQuantity], [WasteQuantity], [RowVersion])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryUsageItems]
  ADD CONSTRAINT [FK_InventoryUsageItems_InsertionItems] FOREIGN KEY ([InsertionItemId]) REFERENCES [job].[InsertionItems] ([Id]) ON DELETE CASCADE
GO