CREATE TABLE [job].[TextTransformTypes] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_TextTransformTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO