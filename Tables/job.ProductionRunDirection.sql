CREATE TABLE [job].[ProductionRunDirection] (
  [Id] [int] IDENTITY,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_ProductionRunDirection] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO