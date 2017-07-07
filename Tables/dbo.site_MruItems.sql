CREATE TABLE [dbo].[site_MruItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Created] [datetime] NOT NULL,
  [ObjectId] [int] NOT NULL,
  [ObjectType] [nvarchar](400) NOT NULL,
  [UserId] [int] NOT NULL,
  CONSTRAINT [PK_site_MruItems] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_site_MruItems]
  ON [dbo].[site_MruItems] ([UserId], [ObjectType], [ObjectId])
  ON [PRIMARY]
GO