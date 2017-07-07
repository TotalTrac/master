﻿CREATE TABLE [usps].[Report] (
  [REPORT_FINALIZED] [int] NULL,
  [REPORT_FORWARDED] [int] NULL,
  [REPORT_PIECES] [int] NOT NULL,
  [REPORT_RETURNED] [int] NULL,
  [REPORT_SCANNED] [int] NULL,
  [REPORT_SEGMENTID] [int] NOT NULL,
  [REPORT_TOTALHOURS] [int] NULL,
  [REPORT_ZIPCODE] [char](5) NOT NULL,
  [REPORT_SCFID] [int] NULL
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_Report]
  ON [usps].[Report] ([REPORT_SEGMENTID], [REPORT_SCFID])
  ON [PRIMARY]
GO