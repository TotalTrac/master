CREATE TABLE [job].[ProductionProcessCounts] (
  [Id] [int] IDENTITY,
  [InspectorId] [int] NOT NULL,
  [Count] [int] NOT NULL,
  [CountTime] [datetime] NOT NULL,
  [ProductionProcessId] [int] NOT NULL,
  [SeqNum] [int] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_ProductionProcessCounts] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[ProductionProcessCounts]
  ADD CONSTRAINT [FK_ProductionProcessCounts_ProductionProcesses_Id] FOREIGN KEY ([ProductionProcessId]) REFERENCES [job].[ProductionProcesses] ([Id])
GO