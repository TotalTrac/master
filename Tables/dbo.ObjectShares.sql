CREATE TABLE [dbo].[ObjectShares] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Created] [datetime] NOT NULL,
  [CreatedByID] [int] NOT NULL,
  [ObjectId] [int] NOT NULL,
  [ObjectType] [nvarchar](200) NOT NULL,
  [UserId] [int] NOT NULL,
  CONSTRAINT [PK_ObjectShares] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_ObjectShares_Uniqueness]
  ON [dbo].[ObjectShares] ([ObjectType], [ObjectId], [UserId])
  ON [PRIMARY]
GO