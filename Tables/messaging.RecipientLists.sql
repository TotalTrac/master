CREATE TABLE [messaging].[RecipientLists] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [CreatedById] [int] NULL,
  [MessageId] [int] NOT NULL,
  [RecipientUserId] [int] NOT NULL,
  [Created] [datetime] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_RecipientLists] PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [messaging].[RecipientLists]
  ADD CONSTRAINT [FK_RecipientLists_PrivateMessages_Id] FOREIGN KEY ([MessageId]) REFERENCES [messaging].[PrivateMessages] ([Id])
GO

ALTER TABLE [messaging].[RecipientLists]
  ADD CONSTRAINT [FK_RecipientLists_Users_USER_USERID] FOREIGN KEY ([RecipientUserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO