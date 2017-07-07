CREATE TABLE [job].[InsertionProductionProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [KitId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy_copy_copy_copy_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[InsertionProductionProcessGroups]
  ADD CONSTRAINT [FK_InsertionProductionProcessGroups_Kits_Id] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id])
GO

ALTER TABLE [job].[InsertionProductionProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_copy_copy_copy_copy_copy_copy_copy_copy] FOREIGN KEY ([ProcessId]) REFERENCES [job].[ProductionProcesses] ([Id])
GO