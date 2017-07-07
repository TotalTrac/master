CREATE TABLE [job].[PersonalizationProductionItems] (
  [Id] [int] IDENTITY,
  [AssignmentId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_ASSIGNMENTID] DEFAULT (0),
  [MachineId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_MACHINEID] DEFAULT (0),
  [ItemId] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_PACKAGEID] DEFAULT (0),
  [Quanitity] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_QUANTITY] DEFAULT (0),
  [Time] [nchar](25) NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_TIME] DEFAULT ('0:00:00'),
  [Type] [int] NOT NULL CONSTRAINT [DF_tblPersonalizationProductionItems_PRODUCTIONITEM_TYPE] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblPersonalizationProductionItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblPersonalizationProductionItems_AssignmentID]
  ON [job].[PersonalizationProductionItems] ([AssignmentId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblPersonalizationProductionItems_PackageID]
  ON [job].[PersonalizationProductionItems] ([ItemId])
  ON [PRIMARY]
GO

ALTER TABLE [job].[PersonalizationProductionItems]
  ADD CONSTRAINT [FK_PersonalizationProductionItems_PersonalizationItem] FOREIGN KEY ([ItemId]) REFERENCES [job].[InsertionPersonalizationItem] ([Id])
GO

ALTER TABLE [job].[PersonalizationProductionItems]
  ADD CONSTRAINT [FK_PersonalizationProductionItems_PersonalizationProductionItemTypes] FOREIGN KEY ([Type]) REFERENCES [job].[PersonalizationProductionItemTypes] ([ID])
GO