﻿CREATE TABLE [dbo].[Projects] (
  [PROJECT_ID] [int] IDENTITY,
  [PROJECT_CLIENTID] [int] NOT NULL,
  [PROJECT_NAME] [nvarchar](100) NOT NULL,
  [PROJECT_PARENTID] [int] NULL,
  [PROJECT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([PROJECT_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Projects_ClientID]
  ON [dbo].[Projects] ([PROJECT_CLIENTID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Projects_Uniqueness]
  ON [dbo].[Projects] ([PROJECT_CLIENTID], [PROJECT_PARENTID], [PROJECT_NAME])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[Projects]
  ADD CONSTRAINT [FK_Projects_Clients] FOREIGN KEY ([PROJECT_CLIENTID]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO