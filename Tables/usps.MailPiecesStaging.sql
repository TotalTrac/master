﻿CREATE TABLE [usps].[MailPiecesStaging] (
  [MAILPIECE_ADDRESS1] [nvarchar](60) NULL,
  [MAILPIECE_ADDRESS2] [nvarchar](60) NULL,
  [MAILPIECE_ADDRESS3] [nvarchar](60) NULL,
  [MAILPIECE_CITY] [nvarchar](28) NULL,
  [MAILPIECE_COMPANY] [nvarchar](50) NULL,
  [MAILPIECE_CRRT] [char](4) NULL,
  [MAILPIECE_FINALIZESCANID] [int] NULL,
  [MAILPIECE_FIRSTNAME] [nvarchar](20) NULL,
  [MAILPIECE_FIRSTSCANID] [int] NULL,
  [MAILPIECE_FORWARDSCANID] [int] NULL,
  [MAILPIECE_GROUPID] [nvarchar](25) NULL,
  [MAILPIECE_INDIVIDUALID] [nvarchar](25) NULL,
  [MAILPIECE_LASTNAME] [nvarchar](20) NULL,
  [MAILPIECE_LASTSCANID] [int] NULL,
  [MAILPIECE_RETURNSCANID] [int] NULL,
  [MAILPIECE_ROUTINGCODE] [char](11) NOT NULL,
  [MAILPIECE_SCFID] [int] NOT NULL,
  [MAILPIECE_SEGMENTID] [int] NOT NULL,
  [MAILPIECE_STATE] [char](2) NULL,
  [MAILPIECE_THREADID] [int] NOT NULL,
  [MAILPIECE_TITLE] [nvarchar](50) NULL,
  [MAILPIECE_TRACKINGCODE] [char](20) NOT NULL,
  [MAILPIECE_ZIPCODE] [char](5) NULL,
  [MAILPIECE_ZIPCODEEXT] [char](4) NULL
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_MailPiecesStaging_ThreadID]
  ON [usps].[MailPiecesStaging] ([MAILPIECE_THREADID])
  ON [PRIMARY]
GO