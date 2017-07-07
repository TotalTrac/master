CREATE TABLE [dbo].[MailPieceFields] (
  [FIELD_ID] [int] IDENTITY (-2147483648, 1),
  [FIELD_MAILPIECEID] [int] NOT NULL,
  [FIELD_NAME] [nvarchar](100) NOT NULL,
  [FIELD_VALUE] [sql_variant] NULL,
  CONSTRAINT [PK_MailPieceFields] PRIMARY KEY CLUSTERED ([FIELD_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceFields_Name]
  ON [dbo].[MailPieceFields] ([FIELD_NAME])
  INCLUDE ([FIELD_MAILPIECEID], [FIELD_VALUE])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_MailPieceFields_Uniqueness]
  ON [dbo].[MailPieceFields] ([FIELD_MAILPIECEID], [FIELD_NAME])
  INCLUDE ([FIELD_VALUE])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[MailPieceFields] WITH NOCHECK
  ADD CONSTRAINT [FK_MailPieceFields_MailPieces] FOREIGN KEY ([FIELD_MAILPIECEID]) REFERENCES [dbo].[MailPieces] ([MAILPIECE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[MailPieceFields]
  NOCHECK CONSTRAINT [FK_MailPieceFields_MailPieces]
GO