﻿CREATE TABLE [usps].[NdcFinalizedAverages] (
  [NDC_ID] [int] NOT NULL,
  [NDC_AVERAGEHOURS] [int] NOT NULL,
  [NDC_ENTRYPOINT] [char](5) NOT NULL,
  [NDC_PIECES] [int] NOT NULL,
  [NDC_POSTALCLASSID] [int] NOT NULL,
  [NDC_SCANDATE] [date] NOT NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IDX_NdcFinalizedAverages_EntryPointScanDate]
  ON [usps].[NdcFinalizedAverages] ([NDC_ENTRYPOINT], [NDC_SCANDATE])
  INCLUDE ([NDC_ID], [NDC_AVERAGEHOURS], [NDC_PIECES], [NDC_POSTALCLASSID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_PostalClassID]
  ON [usps].[NdcFinalizedAverages] ([NDC_POSTALCLASSID])
  INCLUDE ([NDC_AVERAGEHOURS], [NDC_ENTRYPOINT], [NDC_PIECES], [NDC_SCANDATE])
  ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [PK_NdcFinalizedAverages]
  ON [usps].[NdcFinalizedAverages] ([NDC_ID], [NDC_ENTRYPOINT], [NDC_POSTALCLASSID], [NDC_SCANDATE])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[NdcFinalizedAverages]
  ADD CONSTRAINT [FK_NdcFinalizedAverages_NDCs] FOREIGN KEY ([NDC_ID]) REFERENCES [dbo].[NDCs] ([NDC_ID]) ON DELETE CASCADE
GO