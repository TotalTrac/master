CREATE TABLE [usps].[MailPieceUploadFileData] (
  [FILEDATA_ID] [int] IDENTITY (-2147483648, 1),
  [FILEDATA_BYTES] [varbinary](max) NULL,
  [FILEDATA_FILEID] [int] NOT NULL,
  CONSTRAINT [PK_MailPieceUploadFileData] PRIMARY KEY CLUSTERED ([FILEDATA_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_MailPieceUploadFileData_FileID]
  ON [usps].[MailPieceUploadFileData] ([FILEDATA_FILEID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[MailPieceUploadFileData]
  ADD CONSTRAINT [FK_MailPieceUploadFileData_MailPieceUploadFiles] FOREIGN KEY ([FILEDATA_FILEID]) REFERENCES [usps].[MailPieceUploadFiles] ([FILE_ID])
GO