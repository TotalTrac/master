CREATE TABLE [file].[Folders] (
  [FOLDER_ID] [int] IDENTITY,
  [FOLDER_CREATED] [datetime] NOT NULL,
  [FOLDER_CREATEDBYID] [int] NOT NULL,
  [FOLDER_DESCRIPTION] [nvarchar](200) NULL,
  [FOLDER_FOLDERID] [int] NULL,
  [FOLDER_NAME] [nvarchar](100) NOT NULL,
  [FOLDER_USERID] [int] NOT NULL,
  [FOLDER_ROWVERSION] [timestamp],
  CONSTRAINT [PK_FileFolders] PRIMARY KEY CLUSTERED ([FOLDER_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_FileFolders_FolderID]
  ON [file].[Folders] ([FOLDER_FOLDERID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_FileFolders_Uniqueness]
  ON [file].[Folders] ([FOLDER_USERID], [FOLDER_FOLDERID], [FOLDER_NAME])
  ON [PRIMARY]
GO

CREATE INDEX [IX_FileFolders_UserID]
  ON [file].[Folders] ([FOLDER_USERID])
  ON [PRIMARY]
GO

ALTER TABLE [file].[Folders]
  ADD CONSTRAINT [FK_FileFolders_Users] FOREIGN KEY ([FOLDER_USERID]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO

ALTER TABLE [file].[Folders]
  ADD CONSTRAINT [FK_Folders_Folders] FOREIGN KEY ([FOLDER_FOLDERID]) REFERENCES [file].[Folders] ([FOLDER_ID])
GO