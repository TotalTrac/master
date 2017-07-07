CREATE TABLE [messaging].[PrivateMessages] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AttachmentListId] [int] NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [IsRead] [bit] NULL,
  [IsStarredRecipient] [bit] NULL,
  [IsStarredSender] [bit] NULL,
  [IsTrashRecipient] [bit] NULL,
  [IsTrashSender] [bit] NULL,
  [Message] [nvarchar](max) NULL,
  [Modified] [datetime] NULL,
  [ParentId] [int] NULL,
  [RecipientListId] [int] NULL,
  [SenderUserId] [int] NULL,
  [SentDate] [datetime] NULL,
  [Subject] [nvarchar](1000) NULL,
  [TrashedDateRecipient] [datetime] NULL,
  [TrashedDateSender] [datetime] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_PrivateMessages] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [messaging].[PrivateMessages]
  ADD CONSTRAINT [FK_PrivateMessages_AttachmentLists_Id] FOREIGN KEY ([AttachmentListId]) REFERENCES [messaging].[AttachmentLists] ([Id])
GO

ALTER TABLE [messaging].[PrivateMessages]
  ADD CONSTRAINT [FK_PrivateMessages_RecipientLists_Id] FOREIGN KEY ([RecipientListId]) REFERENCES [messaging].[RecipientLists] ([Id])
GO

ALTER TABLE [messaging].[PrivateMessages]
  ADD CONSTRAINT [FK_PrivateMessages_Users_USER_USERID] FOREIGN KEY ([SenderUserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO