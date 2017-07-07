CREATE TABLE [email].[Screenshots] (
  [Id] [int] IDENTITY,
  [FullSize] [varbinary](max) NOT NULL,
  [ThumbNail] [varbinary](max) NOT NULL,
  [VersionId] [int] NOT NULL,
  CONSTRAINT [PK_CampaignVersionImages] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CampaignVersionImages_CampaignVersions]
  ON [email].[Screenshots] ([VersionId])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Screenshots]
  ADD CONSTRAINT [FK_VersionImages_Versions] FOREIGN KEY ([VersionId]) REFERENCES [email].[Versions] ([Id]) ON DELETE CASCADE
GO