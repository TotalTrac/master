﻿CREATE TABLE [dbo].[UserImages] (
  [Id] [int] IDENTITY,
  [ClassName] [varchar](200) NULL,
  [ContentTypeId] [int] NOT NULL,
  [Compressed] [bit] NOT NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [Data] [varbinary](max) NULL,
  [Description] [nvarchar](200) NULL,
  [Name] [nvarchar](2000) NOT NULL,
  [Size] [bigint] NOT NULL CONSTRAINT [DF_FILES_FILE_SIZE_copy_copy] DEFAULT (0),
  [TypeId] [int] NOT NULL CONSTRAINT [DF_FILES_FILE_TYPE_ID_copy_copy] DEFAULT (0),
  [Uploaded] [datetime] NOT NULL CONSTRAINT [DF_FILES_FILE_UPLOADED_copy_copy] DEFAULT (getdate()),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Files_copy_copy] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserImages]
  ADD CONSTRAINT [FK_Files_ContentTypes_copy_copy] FOREIGN KEY ([ContentTypeId]) REFERENCES [file].[ContentTypes] ([CONTENTTYPE_ID])
GO

ALTER TABLE [dbo].[UserImages]
  ADD CONSTRAINT [FK_Files_FileTypes_copy_copy] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[UserImageTypes] ([Id]) ON DELETE CASCADE
GO