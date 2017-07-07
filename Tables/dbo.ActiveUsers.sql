CREATE TABLE [dbo].[ActiveUsers] (
  [Id] [int] IDENTITY,
  [ConnectionId] [varchar](200) NULL,
  [Expiration] [datetime] NULL,
  [UserId] [int] NOT NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_ActiveUsers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActiveUsers]
  ADD CONSTRAINT [FK_ActiveUsers_Users_USER_USERID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO