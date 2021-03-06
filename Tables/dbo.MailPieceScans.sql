﻿CREATE TABLE [dbo].[MailPieceScans] (
  [MAILPIECESCAN_ID] [int] IDENTITY (-2147483648, 1),
  [MAILPIECESCAN_DATETIME] [datetime] NOT NULL,
  [MAILPIECESCAN_FACILITYID] [int] NOT NULL,
  [MAILPIECESCAN_MAILPIECEID] [int] NOT NULL,
  [MAILPIECESCAN_OPERATIONID] [int] NOT NULL,
  [MAILPIECESCAN_CREATED] [datetime] NOT NULL CONSTRAINT [DF__MailPiece__MAILP__51BC803F] DEFAULT (getutcdate()),
  CONSTRAINT [PK_MailPieceScans] PRIMARY KEY CLUSTERED ([MAILPIECESCAN_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceScans_Created]
  ON [dbo].[MailPieceScans] ([MAILPIECESCAN_CREATED])
  INCLUDE ([MAILPIECESCAN_ID], [MAILPIECESCAN_DATETIME], [MAILPIECESCAN_FACILITYID], [MAILPIECESCAN_MAILPIECEID], [MAILPIECESCAN_OPERATIONID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceScans_DateTimeOperationID]
  ON [dbo].[MailPieceScans] ([MAILPIECESCAN_DATETIME], [MAILPIECESCAN_OPERATIONID])
  INCLUDE ([MAILPIECESCAN_MAILPIECEID], [MAILPIECESCAN_ID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceScans_MailPieceID]
  ON [dbo].[MailPieceScans] ([MAILPIECESCAN_MAILPIECEID])
  INCLUDE ([MAILPIECESCAN_OPERATIONID], [MAILPIECESCAN_DATETIME])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[MailPieceScans]
  ADD CONSTRAINT [FK_MailPieceScans_MailPieces] FOREIGN KEY ([MAILPIECESCAN_MAILPIECEID]) REFERENCES [dbo].[MailPieces] ([MAILPIECE_ID]) ON DELETE CASCADE
GO