CREATE TABLE [dbo].[_stjohns] (
  [id] [int] IDENTITY,
  [mailpieceid] [int] NOT NULL,
  [donation] [money] NOT NULL DEFAULT (0),
  [remove] [bit] NOT NULL DEFAULT (0)
)
ON [PRIMARY]
GO