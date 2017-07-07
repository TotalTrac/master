CREATE TABLE [job].[AffixingItems] (
  [Id] [int] IDENTITY,
  [InsertItemId] [int] NOT NULL CONSTRAINT [DF__AffixingI__Inser__72FCAD22] DEFAULT (0),
  [InventoryItemId] [int] NULL,
  [Description] [nvarchar](max) NULL CONSTRAINT [DF__AffixingI__Descr__73F0D15B] DEFAULT (''),
  [AffixingLocationTypeId] [int] NOT NULL,
  [Size] [nvarchar](50) NULL CONSTRAINT [DF__AffixingIt__Size__74E4F594] DEFAULT (''),
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [StampTypeId] [int] NULL CONSTRAINT [DF__AffixingI__Stamp__75D919CD] DEFAULT (0),
  [TabbedEdges] [int] NULL CONSTRAINT [DF__AffixingI__Tabbe__76CD3E06] DEFAULT (0),
  [Tabs] [int] NOT NULL CONSTRAINT [DF__AffixingIt__Tabs__77C1623F] DEFAULT (0),
  [TabTypeId] [int] NULL CONSTRAINT [DF__AffixingI__TabTy__78B58678] DEFAULT (0),
  [TypeId] [int] NOT NULL CONSTRAINT [DF__AffixingI__TypeI__79A9AAB1] DEFAULT (0),
  [Up] [int] NULL CONSTRAINT [DF__AffixingItem__Up__7A9DCEEA] DEFAULT (0),
  [XBaseline] [int] NULL CONSTRAINT [DF__AffixingI__XBase__7B91F323] DEFAULT (0),
  [XOffset] [decimal](5, 2) NULL CONSTRAINT [DF__AffixingI__XOffs__7C86175C] DEFAULT (0.0),
  [YBaseline] [int] NULL CONSTRAINT [DF__AffixingI__YBase__7D7A3B95] DEFAULT (0),
  [YOffset] [decimal](5, 2) NULL CONSTRAINT [DF__AffixingI__YOffs__7E6E5FCE] DEFAULT (0.0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK__Affixing__3214EC0771F43B45] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[AffixingItems]
  ADD CONSTRAINT [FK__AffixingI__Affix__7F628407] FOREIGN KEY ([AffixingLocationTypeId]) REFERENCES [job].[AffixingLocations] ([Id])
GO

ALTER TABLE [job].[AffixingItems]
  ADD CONSTRAINT [FK__AffixingI__Inser__0056A840] FOREIGN KEY ([InsertItemId]) REFERENCES [job].[InsertionItems] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[AffixingItems]
  ADD CONSTRAINT [FK__AffixingI__Inven__014ACC79] FOREIGN KEY ([InventoryItemId]) REFERENCES [dbo].[InventoryItems] ([ID])
GO

ALTER TABLE [job].[AffixingItems]
  ADD CONSTRAINT [FK__AffixingI__Stamp__033314EB] FOREIGN KEY ([StampTypeId]) REFERENCES [job].[StampTypes] ([Id])
GO

ALTER TABLE [job].[AffixingItems]
  ADD CONSTRAINT [FK__AffixingI__TabTy__04273924] FOREIGN KEY ([TabTypeId]) REFERENCES [job].[TabTypes] ([Id])
GO

ALTER TABLE [job].[AffixingItems] WITH NOCHECK
  ADD CONSTRAINT [FK__AffixingI__TypeI__023EF0B2] FOREIGN KEY ([TypeId]) REFERENCES [job].[AffixingItemTypes] ([Id])
GO