CREATE TABLE [job].[ProductionPrinters] (
  [Id] [int] IDENTITY,
  [FeedTypeId] [int] NOT NULL,
  [Name] [varchar](50) NOT NULL,
  [MaxHeight] [decimal](7, 4) NULL,
  [MaxWidth] [decimal](7, 4) NULL,
  [Model] [varchar](50) NULL,
  [OutputTypeId] [int] NULL,
  [ProductionTargetId] [int] NOT NULL,
  [RunSpeed] [int] NULL,
  [RunSpeedUnitId] [int] NULL,
  [ModeId] [int] NULL,
  CONSTRAINT [PK_ProductionPrinters] PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
GO