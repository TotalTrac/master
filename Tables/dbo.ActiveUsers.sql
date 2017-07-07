CREATE TABLE [dbo].[ActiveUsers] (
  [Id] [int] IDENTITY,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [Expiration] [datetime] NULL,
  [UserId] [int] NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_ActiveUsers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActiveUsers]
  ADD CONSTRAINT [FK_ActiveUsers_Users_USER_USERID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO