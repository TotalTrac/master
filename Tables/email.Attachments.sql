CREATE TABLE [email].[Attachments] (
  [Id] [int] IDENTITY,
  [Data] [varbinary](max) NOT NULL,
  [FileName] [nvarchar](200) NOT NULL,
  [VersionId] [int] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_CampaignVersionAttachments] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignVersionAttachments_CampaignVersionID]
  ON [email].[Attachments] ([VersionId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Attachments]
  ADD CONSTRAINT [FK_VersionAttachments_Versions] FOREIGN KEY ([VersionId]) REFERENCES [email].[Versions] ([Id]) ON DELETE CASCADE
GO