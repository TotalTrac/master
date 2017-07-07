CREATE TABLE [job].[InsertionPersonalizationItem] (
  [Id] [int] IDENTITY,
  [DataType] [int] NOT NULL CONSTRAINT [DF__Insertion__DataT__538401C9] DEFAULT (1),
  [Description] [varchar](max) NOT NULL,
  [FeedId] [int] NOT NULL,
  [Indicia] [varchar](100) NULL,
  [InsertItemId] [int] NOT NULL,
  [LaserTypeId] [int] NULL,
  [LayoutId] [int] NOT NULL,
  [ModeId] [int] NOT NULL,
  [OrientationId] [int] NOT NULL,
  [RunDirectionId] [int] NOT NULL,
  [TargetId] [int] NOT NULL,
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK__Insertio__3214EC07A51529C1] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__FeedI__54782602] FOREIGN KEY ([FeedId]) REFERENCES [job].[ProductionFeeds] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__Inser__5A30FF58] FOREIGN KEY ([InsertItemId]) REFERENCES [job].[InsertionItems] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[InsertionPersonalizationItem] WITH NOCHECK
  ADD CONSTRAINT [FK__Insertion__Laser__5B252391] FOREIGN KEY ([LaserTypeId]) REFERENCES [job].[LaserTypes] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__Layou__556C4A3B] FOREIGN KEY ([LayoutId]) REFERENCES [job].[ProductionLayouts] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__ModeI__56606E74] FOREIGN KEY ([ModeId]) REFERENCES [job].[ProductionModes] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__Orien__575492AD] FOREIGN KEY ([OrientationId]) REFERENCES [job].[ProductionOrientations] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__RunDi__5848B6E6] FOREIGN KEY ([RunDirectionId]) REFERENCES [job].[ProductionRunDirection] ([Id])
GO

ALTER TABLE [job].[InsertionPersonalizationItem]
  ADD CONSTRAINT [FK__Insertion__Targe__593CDB1F] FOREIGN KEY ([TargetId]) REFERENCES [job].[ProductionTargets] ([Id])
GO