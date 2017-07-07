CREATE TABLE [job].[SampleItems] (
  [Id] [int] IDENTITY,
  [Copies] [int] NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_COPIES] DEFAULT (0),
  [GenericText] [nvarchar](100) NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_GENERICTEXT] DEFAULT (''),
  [KitId] [int] NOT NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_PACKAGEID] DEFAULT (0),
  [Quantity] [int] NOT NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_QUANTITY] DEFAULT (0),
  [Run] [int] NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_RUN] DEFAULT (0),
  [Type] [int] NOT NULL CONSTRAINT [DF_tblSampleItems_SAMPLEITEM_TYPE] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SampleItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_SampleItems_SegmentId]
  ON [job].[SampleItems] ([KitId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [job].[SampleItems] WITH NOCHECK
  ADD CONSTRAINT [FK__SampleItem__Type__39C42FC6] FOREIGN KEY ([Type]) REFERENCES [job].[SampleItemTypes] ([Id])
GO

ALTER TABLE [job].[SampleItems]
  ADD CONSTRAINT [FK_SampleItems_MailSegments] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO