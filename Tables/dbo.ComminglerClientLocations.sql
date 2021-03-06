﻿CREATE TABLE [dbo].[ComminglerClientLocations] (
  [COMMINGLERLOCATION_ID] [int] IDENTITY (-2147483648, 1),
  [COMMINGLERLOCATION_COMMINGLERID] [int] NOT NULL,
  [COMMINGLERLOCATION_LOCATIONID] [int] NOT NULL,
  [COMMINGLERLOCATION_VALUE] [int] NOT NULL,
  CONSTRAINT [PK_ComminglerLocations] PRIMARY KEY CLUSTERED ([COMMINGLERLOCATION_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ComminglerClientLocations_LocationID]
  ON [dbo].[ComminglerClientLocations] ([COMMINGLERLOCATION_LOCATIONID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[ComminglerClientLocations]
  ADD CONSTRAINT [FK_ComminglerLocations_ClientLocations] FOREIGN KEY ([COMMINGLERLOCATION_LOCATIONID]) REFERENCES [dbo].[ClientLocations] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ComminglerClientLocations]
  ADD CONSTRAINT [FK_ComminglerLocationss_Comminglers] FOREIGN KEY ([COMMINGLERLOCATION_COMMINGLERID]) REFERENCES [dbo].[Comminglers] ([COMMINGLER_ID]) ON DELETE CASCADE
GO