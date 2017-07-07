CREATE TABLE [usps].[ScfFinalizedAverages] (
  [SCF_ID] [int] NOT NULL,
  [SCF_AVERAGEHOURS] [int] NOT NULL,
  [SCF_ENTRYPOINT] [char](5) NOT NULL,
  [SCF_PIECES] [int] NOT NULL,
  [SCF_POSTALCLASSID] [int] NOT NULL,
  [SCF_SCANDATE] [date] NOT NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IDX_ScfFinalizedAverages_EntryPointScanDate]
  ON [usps].[ScfFinalizedAverages] ([SCF_ID], [SCF_ENTRYPOINT], [SCF_SCANDATE])
  INCLUDE ([SCF_AVERAGEHOURS], [SCF_PIECES], [SCF_POSTALCLASSID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[ScfFinalizedAverages]
  ADD CONSTRAINT [FK_ScfFinalizedAverages_SCFs] FOREIGN KEY ([SCF_ID]) REFERENCES [dbo].[SCFs] ([SCF_ID]) ON DELETE CASCADE
GO