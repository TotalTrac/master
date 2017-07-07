CREATE TABLE [usps].[MailPieceScansStaging] (
  [SCAN_CREATED] [datetime] NOT NULL CONSTRAINT [DF_51BC803F] DEFAULT (getutcdate()),
  [SCAN_DATETIME] [datetime] NOT NULL,
  [SCAN_FACILITYID] [int] NOT NULL,
  [SCAN_MAILPIECEID] [int] NOT NULL,
  [SCAN_OPERATIONID] [int] NOT NULL,
  [SCAN_THREADID] [int] NOT NULL
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_MailPieceScansStaging_ThreadID]
  ON [usps].[MailPieceScansStaging] ([SCAN_THREADID])
  ON [PRIMARY]
GO