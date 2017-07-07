CREATE TABLE [dbo].[site_PinnedItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Created] [datetime] NOT NULL,
  [ObjectId] [int] NOT NULL,
  [ObjectType] [nvarchar](400) NOT NULL,
  [UserId] [int] NOT NULL,
  CONSTRAINT [PK_site_PinnedItems] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_site_PinnedItems]
  ON [dbo].[site_PinnedItems] ([UserId], [ObjectType], [ObjectId])
  ON [PRIMARY]
GO