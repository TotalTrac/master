CREATE TABLE [job].[PersonalizationProductionProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [InsertionPersonalizationItemId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[PersonalizationProductionProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_copy_copy] FOREIGN KEY ([ProcessId]) REFERENCES [job].[ProductionProcesses] ([Id])
GO

ALTER TABLE [job].[PersonalizationProductionProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_Kits_Id_copy_copy] FOREIGN KEY ([InsertionPersonalizationItemId]) REFERENCES [job].[InsertionPersonalizationItem] ([Id])
GO