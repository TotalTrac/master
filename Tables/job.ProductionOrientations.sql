CREATE TABLE [job].[ProductionOrientations] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_ProductionOrientations] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO