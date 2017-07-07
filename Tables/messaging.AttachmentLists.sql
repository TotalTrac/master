CREATE TABLE [messaging].[AttachmentLists] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [MessageFileId] [int] NULL,
  [MessageId] [int] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_AttachmentLists] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [messaging].[AttachmentLists]
  ADD CONSTRAINT [FK_AttachmentLists_MessageFiles_Id] FOREIGN KEY ([MessageFileId]) REFERENCES [messaging].[MessageFiles] ([Id])
GO

ALTER TABLE [messaging].[AttachmentLists]
  ADD CONSTRAINT [FK_AttachmentLists_PrivateMessages_Id] FOREIGN KEY ([MessageId]) REFERENCES [messaging].[PrivateMessages] ([Id])
GO