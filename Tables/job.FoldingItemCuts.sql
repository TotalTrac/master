CREATE TABLE [job].[FoldingItemCuts] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [Baseline] [int] NOT NULL,
  [CutType] [int] NOT NULL,
  [FoldingItemId] [int] NOT NULL,
  [Measurement] [decimal](7, 4) NOT NULL,
  [RowVersion] [timestamp] NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[FoldingItemCuts] WITH NOCHECK
  ADD CONSTRAINT [FK__FoldingIt__CutTy__22E0CA6E] FOREIGN KEY ([CutType]) REFERENCES [job].[CutType] ([Id])
GO

ALTER TABLE [job].[FoldingItemCuts]
  ADD CONSTRAINT [FK__FoldingIt__Foldi__23D4EEA7] FOREIGN KEY ([FoldingItemId]) REFERENCES [job].[FoldingItems] ([Id]) ON DELETE CASCADE
GO