CREATE TABLE [job].[DataProcessingItem] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AnalysisType] [int] NULL,
  [DataServiceType] [int] NULL,
  [Description] [varchar](max) NULL,
  [KitId] [int] NOT NULL,
  [MatchTypeId] [int] NULL,
  [MergePurgeType] [int] NULL,
  [NcoaDate] [date] NULL,
  [NcoaType] [int] NULL,
  [ProductionTargetId] [int] NULL,
  [ReturnFiles] [bit] NULL,
  [ReturnFileDescription] [varchar](max) NULL,
  [SuppressionType] [int] NULL,
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_DataProcessingItem] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[DataProcessingItem]
  ADD CONSTRAINT [FK_DataProcessingItem_Kits] FOREIGN KEY ([KitId]) REFERENCES [job].[Kits] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[DataProcessingItem]
  ADD CONSTRAINT [FK_DataProcessingItem_NcoaTypes] FOREIGN KEY ([NcoaType]) REFERENCES [job].[NcoaTypes] ([Id])
GO