CREATE TABLE [usps].[MailPieceScanUpdates] (
  [MAILPIECE_ID] [int] NOT NULL,
  [MAILPIECE_SEGMENTID] [int] NOT NULL,
  [MAILPIECE_UPDATEKEY] [uniqueidentifier] NULL
)
ON [PRIMARY]
GO