CREATE TABLE [job].[Cuts] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [CuttingItemId] [int] NOT NULL,
  [CutTypeId] [int] NOT NULL,
  [BaselineTypeId] [int] NOT NULL,
  [Measurement] [decimal](7, 4) NOT NULL,
  [Rowversion] [timestamp],
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[Cuts]
  ADD FOREIGN KEY ([BaselineTypeId]) REFERENCES [job].[Baselines] ([ID])
GO

ALTER TABLE [job].[Cuts]
  ADD CONSTRAINT [FK__Cuts__CuttingIte__3005BB62] FOREIGN KEY ([CuttingItemId]) REFERENCES [job].[CuttingItems] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[Cuts] WITH NOCHECK
  ADD CONSTRAINT [FK__Cuts__CutTypeId__2E1D72F0] FOREIGN KEY ([CutTypeId]) REFERENCES [job].[CutType] ([Id])
GO