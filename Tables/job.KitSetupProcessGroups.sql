CREATE TABLE [job].[KitSetupProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [KitId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy_copy_copy_copy_copy_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[KitSetupProcessGroups]
  ADD CONSTRAINT [FK_InsertionProductionProcessGroups_Kits_Id_copy] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id])
GO

ALTER TABLE [job].[KitSetupProcessGroups]
  ADD CONSTRAINT [FK_KitSetupProcessGroups_SetupProcesses_Id] FOREIGN KEY ([ProcessId]) REFERENCES [job].[SetupProcesses] ([Id])
GO