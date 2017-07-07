CREATE TABLE [job].[ProductionItems] (
  [Id] [int] IDENTITY,
  [FeedId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_FEEDID] DEFAULT (0),
  [Indicia] [nvarchar](100) NULL,
  [InsertItemId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_INSERTITEMID] DEFAULT (0),
  [LayoutId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_LAYOUTID] DEFAULT (0),
  [ModeId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_MODEID] DEFAULT (0),
  [OrientationId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_ORIENTATIONID] DEFAULT (0),
  [TargetId] [int] NOT NULL CONSTRAINT [DF_tblProductionItems_PRODUCTIONITEM_TARGETID] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblProductionItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblProductionItems_InsertItemId]
  ON [job].[ProductionItems] ([InsertItemId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO