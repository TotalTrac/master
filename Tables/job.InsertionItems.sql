CREATE TABLE [job].[InsertionItems] (
  [Id] [int] IDENTITY,
  [FacesFlap] [bit] NULL,
  [InventoryItemId] [int] NOT NULL DEFAULT (0),
  [KitId] [int] NOT NULL DEFAULT (0),
  [Name] [varchar](100) NULL,
  [WastePercent] [float] NULL DEFAULT (0),
  [WastePerRun] [int] NULL,
  [ZIndex] [int] NOT NULL DEFAULT (0),
  [RowVersion] [timestamp],
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_InsertionItems_KitId]
  ON [job].[InsertionItems] ([KitId])
  INCLUDE ([Id], [FacesFlap], [InventoryItemId], [Name], [WastePercent], [WastePerRun], [ZIndex], [RowVersion])
  ON [PRIMARY]
GO

ALTER TABLE [job].[InsertionItems]
  ADD CONSTRAINT [FK__Insertion__Inven__7425DB85] FOREIGN KEY ([InventoryItemId]) REFERENCES [dbo].[InventoryItems] ([ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[InsertionItems]
  ADD CONSTRAINT [FK__Insertion__KitId__7519FFBE] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO