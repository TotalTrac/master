CREATE TABLE [usps].[MailPieceUploadFolders] (
  [FOLDER_ID] [int] IDENTITY (-2147483648, 1),
  [FOLDER_PATH] [nvarchar](max) NOT NULL,
  [FOLDER_ROWVERSION] [timestamp],
  CONSTRAINT [PK_MailPieceUploadFolders] PRIMARY KEY CLUSTERED ([FOLDER_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO