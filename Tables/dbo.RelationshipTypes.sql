CREATE TABLE [dbo].[RelationshipTypes] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO