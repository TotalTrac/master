﻿CREATE TABLE [job].[AffixingProductionProcessGroups] (
  [Id] [int] IDENTITY,
  [ProcessId] [int] NOT NULL,
  [AffixingItemId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcessGroups_copy_copy_copy_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[AffixingProductionProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_copy_copy_copy_copy_copy_copy_copy] FOREIGN KEY ([ProcessId]) REFERENCES [job].[ProductionProcesses] ([Id])
GO

ALTER TABLE [job].[AffixingProductionProcessGroups]
  ADD CONSTRAINT [FK_SetupProcessGroups_Kits_Id_copy_copy_copy_copy_copy_copy_copy] FOREIGN KEY ([AffixingItemId]) REFERENCES [job].[AffixingItems] ([Id])
GO