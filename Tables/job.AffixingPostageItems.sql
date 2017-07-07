CREATE TABLE [job].[AffixingPostageItems] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [Denomination] [decimal](6, 3) NULL,
  [PostageTypeId] [int] NOT NULL,
  [Quantity] [int] NULL,
  [StampTypeId] [int] NULL,
  [AffixingItemId] [int] NOT NULL,
  [RowVersion] [timestamp] NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[AffixingPostageItems]
  ADD CONSTRAINT [FK__AffixingP__Posta__1883378C] FOREIGN KEY ([PostageTypeId]) REFERENCES [dbo].[PostageTypes] ([POSTAGETYPE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[AffixingPostageItems]
  ADD CONSTRAINT [FK__AffixingP__Stamp__19775BC5] FOREIGN KEY ([StampTypeId]) REFERENCES [job].[StampTypes] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[AffixingPostageItems]
  ADD CONSTRAINT [FK_AffixingPostageItems_AffixingItems_Id] FOREIGN KEY ([AffixingItemId]) REFERENCES [job].[AffixingItems] ([Id]) ON DELETE CASCADE
GO