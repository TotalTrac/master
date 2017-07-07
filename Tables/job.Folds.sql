CREATE TABLE [job].[Folds] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [BaselineTypeId] [int] NOT NULL,
  [Distance] [decimal](7, 4) NOT NULL,
  [FoldingItemId] [int] NOT NULL,
  [FoldNumber] [int] NOT NULL,
  [Rowversion] [timestamp] NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[Folds]
  ADD FOREIGN KEY ([BaselineTypeId]) REFERENCES [job].[Baselines] ([ID])
GO

ALTER TABLE [job].[Folds]
  ADD CONSTRAINT [FK__Folds__FoldingIt__19576034] FOREIGN KEY ([FoldingItemId]) REFERENCES [job].[FoldingItems] ([Id]) ON DELETE CASCADE
GO