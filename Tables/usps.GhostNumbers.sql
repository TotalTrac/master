﻿CREATE TABLE [usps].[GhostNumbers] (
  [GHOSTNUMBER_ID] [int] IDENTITY (-2147483648, 1),
  [GHOSTNUMBER_CLIENTID] [int] NOT NULL,
  [GHOSTNUMBER_NUMBER] [char](10) NOT NULL,
  [GHOSTNUMBER_PERMITID] [int] NOT NULL,
  CONSTRAINT [PK_GhostNumbers] PRIMARY KEY CLUSTERED ([GHOSTNUMBER_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_GhostNumbers_ClientID]
  ON [usps].[GhostNumbers] ([GHOSTNUMBER_CLIENTID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_GhostNumbers_PermitID]
  ON [usps].[GhostNumbers] ([GHOSTNUMBER_PERMITID], [GHOSTNUMBER_CLIENTID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[GhostNumbers]
  ADD CONSTRAINT [FK_GhostNumbers_Permits] FOREIGN KEY ([GHOSTNUMBER_PERMITID]) REFERENCES [usps].[Permits] ([PERMIT_ID]) ON DELETE CASCADE
GO