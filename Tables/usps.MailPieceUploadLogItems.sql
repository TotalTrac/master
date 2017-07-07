CREATE TABLE [usps].[MailPieceUploadLogItems] (
  [LOG_ID] [int] IDENTITY (-2147483648, 1),
  [LOG_DATETIME] [datetime] NOT NULL,
  [LOG_FILEID] [int] NOT NULL,
  [LOG_MESSAGE] [nvarchar](max) NOT NULL,
  [LOG_MESSAGETYPEID] [int] NOT NULL,
  [LOG_RAWTEXT] [nvarchar](max) NULL,
  [LOG_RECORDNUMBER] [int] NULL,
  CONSTRAINT [PK_MailPieceUploadLog] PRIMARY KEY CLUSTERED ([LOG_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceUploadLogItems]
  ON [usps].[MailPieceUploadLogItems] ([LOG_FILEID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[MailPieceUploadLogItems]
  ADD CONSTRAINT [FK_MailPieceUploadLogItems_MailPieceUploadFiles] FOREIGN KEY ([LOG_FILEID]) REFERENCES [usps].[MailPieceUploadFiles] ([FILE_ID])
GO

ALTER TABLE [usps].[MailPieceUploadLogItems]
  ADD CONSTRAINT [FK_MessageTypes_MailPieceUploadLogItems] FOREIGN KEY ([LOG_MESSAGETYPEID]) REFERENCES [log].[MessageTypes] ([MESSAGETYPE_ID]) ON DELETE CASCADE
GO