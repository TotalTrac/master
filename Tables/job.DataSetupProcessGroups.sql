CREATE TABLE [job].[DataSetupProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [DataProcessingItemId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[DataSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups] FOREIGN KEY ([ProcessId]) REFERENCES [job].[SetupProcesses] ([Id])
GO

ALTER TABLE [job].[DataSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_Kits_Id] FOREIGN KEY ([DataProcessingItemId]) REFERENCES [job].[DataProcessingItem] ([Id])
GO