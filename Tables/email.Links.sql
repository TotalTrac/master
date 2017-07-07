CREATE TABLE [email].[Links] (
  [Id] [int] IDENTITY,
  [Index] [int] NOT NULL CONSTRAINT [DF_tblCampaignVersionLinks_CAMPAIGNVERSIONLINK_INDEX] DEFAULT (0),
  [Text] [nvarchar](200) NULL,
  [Title] [nvarchar](100) NULL,
  [Url] [nvarchar](500) NOT NULL CONSTRAINT [DF_tblCampaignVersionLinks_CAMPAIGNVERSIONLINK_URL] DEFAULT (''),
  [VersionId] [int] NOT NULL CONSTRAINT [DF_tblCampaignVersionLinks_CAMPAIGNVERSIONLINK_CAMPAIGNVERSIONID] DEFAULT (0),
  [Rowversion] [timestamp],
  CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Links_VersionID_Index]
  ON [email].[Links] ([VersionId], [Index])
  ON [PRIMARY]
GO