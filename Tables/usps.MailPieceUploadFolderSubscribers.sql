CREATE TABLE [usps].[MailPieceUploadFolderSubscribers] (
  [SUBSCRIBER_ID] [int] IDENTITY (-2147483648, 1),
  [SUBSCRIBER_EMAILADDRESS] [nvarchar](320) NOT NULL,
  [SUBSCRIBER_EMAILTYPEID] [int] NOT NULL,
  [SUBSCRIBER_EVENTS] [int] NULL,
  [SUBSCRIBER_FOLDERID] [int] NOT NULL,
  [SUBSCRIBER_NAME] [nvarchar](100) NULL,
  [SUBSCRIBER_ROWVERSION] [timestamp],
  CONSTRAINT [PK_MailPieceUploadFolderSubscribers] PRIMARY KEY CLUSTERED ([SUBSCRIBER_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceUploadFolderSubscribers_FolderID]
  ON [usps].[MailPieceUploadFolderSubscribers] ([SUBSCRIBER_FOLDERID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[MailPieceUploadFolderSubscribers]
  ADD CONSTRAINT [FK_MailPieceUploadFolderSubscribers_MailPieceUploadFolders] FOREIGN KEY ([SUBSCRIBER_FOLDERID]) REFERENCES [usps].[MailPieceUploadFolders] ([FOLDER_ID]) ON DELETE CASCADE
GO