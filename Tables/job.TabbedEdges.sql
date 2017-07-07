CREATE TABLE [job].[TabbedEdges] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_TabbedEdges] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO