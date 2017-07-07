CREATE TABLE [usps].[MailPieceUploadFiles] (
  [FILE_ID] [int] IDENTITY (-2147483648, 1),
  [FILE_FOLDERID] [int] NOT NULL,
  [FILE_KEY] [uniqueidentifier] NOT NULL,
  [FILE_LASTMODIFIED] [datetime] NOT NULL,
  [FILE_NAME] [nvarchar](max) NOT NULL,
  [FILE_PROCESSINGBEGUN] [datetime] NULL,
  [FILE_PROCESSINGENDED] [datetime] NULL,
  [FILE_RECORDCOUNT] [int] NULL,
  [FILE_SIZE] [int] NOT NULL,
  [FILE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_MailPieceUploadFiles] PRIMARY KEY CLUSTERED ([FILE_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceUploadFiles_FolderID]
  ON [usps].[MailPieceUploadFiles] ([FILE_FOLDERID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[MailPieceUploadFiles]
  ADD CONSTRAINT [FK_MailPieceUploadFiles_MailPieceUploadFolders] FOREIGN KEY ([FILE_FOLDERID]) REFERENCES [usps].[MailPieceUploadFolders] ([FOLDER_ID]) ON DELETE CASCADE
GO