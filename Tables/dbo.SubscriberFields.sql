CREATE TABLE [dbo].[SubscriberFields] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [nvarchar](200) NOT NULL,
  [SubscriberId] [int] NOT NULL,
  [TypeId] [int] NOT NULL,
  [Value] [sql_variant] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_SubscriberFields] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[SubscriberFields]
  ADD CONSTRAINT [FK_SubscriberFields_FieldTypes] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[FieldTypes] ([Id])
GO

ALTER TABLE [dbo].[SubscriberFields]
  ADD CONSTRAINT [FK_SubscriberFields_Subscribers] FOREIGN KEY ([SubscriberId]) REFERENCES [dbo].[Subscribers] ([Id]) ON DELETE CASCADE
GO