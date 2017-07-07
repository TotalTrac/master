CREATE TABLE [job].[CuttingItems] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [FinalCount] [int] NOT NULL,
  [FinalHeight] [decimal](8, 4) NOT NULL,
  [FinalWidth] [decimal](8, 4) NOT NULL,
  [LocationType] [int] NOT NULL,
  [ItemId] [int] NOT NULL,
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK__CuttingI__3214EC077DB6D9B4] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[CuttingItems]
  ADD CONSTRAINT [FK__CuttingIt__ItemI__239FE47D] FOREIGN KEY ([ItemId]) REFERENCES [job].[InsertionItems] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[CuttingItems] WITH NOCHECK
  ADD CONSTRAINT [FK__CuttingIt__Locat__249408B6] FOREIGN KEY ([LocationType]) REFERENCES [job].[CuttingLocations] ([Id])
GO