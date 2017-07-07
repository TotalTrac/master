CREATE TABLE [dbo].[Options] (
  [Id] [int] IDENTITY,
  [UserId] [int] NOT NULL,
  [Json] [varchar](max) NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED ([Id]),
  CONSTRAINT [KEY_Options_UserId] UNIQUE ([UserId])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Options]
  ADD CONSTRAINT [FK_Options_Users_USER_USERID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO