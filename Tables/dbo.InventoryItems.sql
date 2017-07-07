CREATE TABLE [dbo].[InventoryItems] (
  [ID] [int] IDENTITY,
  [ClientID] [int] NOT NULL,
  [Code] [nvarchar](100) NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedByID] [int] NOT NULL,
  [Depth] [decimal](7, 4) NULL,
  [Description] [nvarchar](100) NULL,
  [FeedType] [int] NULL,
  [Height] [decimal](7, 4) NULL,
  [IsActive] [bit] NOT NULL,
  [IsPinless] [bit] NULL,
  [PaperColor] [varchar](100) NULL,
  [PaperTypeId] [int] NULL,
  [PaperWeight] [int] NULL,
  [ReorderThreshold] [int] NULL,
  [ReorderThresholdTypeID] [int] NULL,
  [ShareTypeId] [int] NULL,
  [SheetHeight] [decimal](7, 4) NULL,
  [SheetPagesHorizontal] [int] NULL,
  [SheetPagesVertical] [int] NULL,
  [SheetWidth] [decimal](7, 4) NULL,
  [TypeID] [int] NOT NULL,
  [WastePercentage] [float] NULL,
  [WastePerRun] [int] NULL,
  [Weight] [decimal](7, 4) NULL,
  [Width] [decimal](7, 4) NULL,
  [RowVersion] [timestamp],
  [NotificationTypeId] [int] NULL,
  CONSTRAINT [PK_InventoryItems] PRIMARY KEY CLUSTERED ([ID]) WITH (FILLFACTOR = 90),
  CONSTRAINT [KEY_InventoryItems] UNIQUE ([Code], [ClientID], [TypeID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_InventoryItems_ClientID]
  ON [dbo].[InventoryItems] ([ClientID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryItems]
  ADD CONSTRAINT [FK_InventoryItems_Clients] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[InventoryItems]
  ADD CONSTRAINT [FK_InventoryItems_Inventory_PaperType] FOREIGN KEY ([PaperTypeId]) REFERENCES [dbo].[Inventory_PaperType] ([Id])
GO

ALTER TABLE [dbo].[InventoryItems]
  ADD CONSTRAINT [FK_InventoryItems_InventoryItemReorderThresholdTypes] FOREIGN KEY ([ReorderThresholdTypeID]) REFERENCES [dbo].[InventoryItemReorderThresholdTypes] ([TYPE_ID])
GO

ALTER TABLE [dbo].[InventoryItems]
  ADD CONSTRAINT [FK_InventoryItems_InventoryItemTypes] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[InventoryItemTypes] ([INVENTORYITEMTYPE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[InventoryItems]
  ADD CONSTRAINT [FK_InventoryItems_Users] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Users] ([USER_USERID])
GO