CREATE TABLE [job].[AffixingPersonalizationItem] (
  [Id] [int] IDENTITY,
  [DataType] [int] NOT NULL,
  [Description] [varchar](max) NOT NULL,
  [FeedId] [int] NOT NULL,
  [Indicia] [varchar](100) NULL,
  [AffixingItemId] [int] NOT NULL,
  [LaserTypeId] [int] NULL,
  [LayoutId] [int] NOT NULL,
  [ModeId] [int] NOT NULL,
  [OrientationId] [int] NOT NULL,
  [RunDirectionId] [int] NOT NULL,
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [TargetId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK__Affixing__3214EC074D4A43B1] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__Affix__0DB0A35E] FOREIGN KEY ([AffixingItemId]) REFERENCES [job].[AffixingItems] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__FeedI__0EA4C797] FOREIGN KEY ([FeedId]) REFERENCES [job].[ProductionFeeds] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem] WITH NOCHECK
  ADD CONSTRAINT [FK__AffixingP__Laser__145DA0ED] FOREIGN KEY ([LaserTypeId]) REFERENCES [job].[LaserTypes] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__Layou__0F98EBD0] FOREIGN KEY ([LayoutId]) REFERENCES [job].[ProductionLayouts] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__ModeI__108D1009] FOREIGN KEY ([ModeId]) REFERENCES [job].[ProductionModes] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__Orien__11813442] FOREIGN KEY ([OrientationId]) REFERENCES [job].[ProductionOrientations] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__RunDi__1275587B] FOREIGN KEY ([RunDirectionId]) REFERENCES [job].[ProductionRunDirection] ([Id])
GO

ALTER TABLE [job].[AffixingPersonalizationItem]
  ADD CONSTRAINT [FK__AffixingP__Targe__13697CB4] FOREIGN KEY ([TargetId]) REFERENCES [job].[ProductionTargets] ([Id])
GO