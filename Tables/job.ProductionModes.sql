CREATE TABLE [job].[ProductionModes] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_ProductionModes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO