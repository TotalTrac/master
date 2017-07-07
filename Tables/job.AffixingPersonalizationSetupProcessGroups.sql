CREATE TABLE [job].[AffixingPersonalizationSetupProcessGroups] (
  [Id] [int] IDENTITY,
  [AffixingPersonalizationSetupProcessId] [int] NOT NULL,
  [AffixingPersonalizationItemId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[AffixingPersonalizationSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_copy_copy_copy_copy_copy] FOREIGN KEY ([AffixingPersonalizationSetupProcessId]) REFERENCES [job].[SetupProcesses] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationSetupProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_Kits_Id_copy_copy_copy_copy_copy] FOREIGN KEY ([AffixingPersonalizationItemId]) REFERENCES [job].[AffixingPersonalizationItem] ([Id])
GO