﻿CREATE TABLE [dbo].[_stjohnsDrop2] (
  [id] [int] IDENTITY,
  [mailpieceid] [int] NOT NULL,
  [donation] [money] NOT NULL DEFAULT (0),
  [remove] [bit] NOT NULL DEFAULT (0)
)
ON [PRIMARY]
GO