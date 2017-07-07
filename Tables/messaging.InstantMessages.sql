CREATE TABLE [messaging].[InstantMessages] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [IsRead] [bit] NULL,
  [Message] [nvarchar](max) NULL,
  [RecipientUserId] [int] NULL,
  [SenderUserId] [int] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_InstantMessages] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [messaging].[InstantMessages]
  ADD CONSTRAINT [FK_InstantMessages_Users_SENDERUSER_USERID] FOREIGN KEY ([SenderUserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO

ALTER TABLE [messaging].[InstantMessages]
  ADD CONSTRAINT [FK_InstantMessages_Users_USER_USERID] FOREIGN KEY ([RecipientUserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO