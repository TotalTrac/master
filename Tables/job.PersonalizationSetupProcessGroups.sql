CREATE TABLE [job].[PersonalizationSetupProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [InsertionPersonalizationItemId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[PersonalizationSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_copy] FOREIGN KEY ([ProcessId]) REFERENCES [job].[SetupProcesses] ([Id])
GO

ALTER TABLE [job].[PersonalizationSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_Kits_Id_copy] FOREIGN KEY ([InsertionPersonalizationItemId]) REFERENCES [job].[InsertionPersonalizationItem] ([Id])
GO