﻿CREATE TABLE [dbo].[SCFs] (
  [SCF_ID] [int] IDENTITY,
  [SCF_LATITUDE] [decimal](9, 6) NOT NULL,
  [SCF_LONGITUDE] [decimal](9, 6) NOT NULL,
  [SCF_NAME] [nvarchar](30) NOT NULL,
  [SCF_NDCID] [int] NOT NULL,
  [SCF_STATE] [char](2) NOT NULL,
  [SCF_ZIPCODE] [char](5) NOT NULL,
  CONSTRAINT [PK_SCFs] PRIMARY KEY CLUSTERED ([SCF_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_SCFs_NDCID]
  ON [dbo].[SCFs] ([SCF_NDCID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_SCFs_State]
  ON [dbo].[SCFs] ([SCF_STATE])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[SCFs]
  ADD CONSTRAINT [FK_SCFs_NDCs] FOREIGN KEY ([SCF_NDCID]) REFERENCES [dbo].[NDCs] ([NDC_ID]) ON DELETE CASCADE
GO