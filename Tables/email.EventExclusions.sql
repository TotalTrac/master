CREATE TABLE [email].[EventExclusions] (
  [Id] [int] IDENTITY,
  [Domain] [nvarchar](255) NULL,
  [ExcludeEvents] [int] NOT NULL CONSTRAINT [DF_CampaignEventExclusions_CAMPAIGNDOMAINEXCLUSION_EXCLUDEEVENTS] DEFAULT (0),
  [VersionId] [int] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_CampaignEventExclusions] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CampaignEventExclusions_Uniqueness]
  ON [email].[EventExclusions] ([VersionId], [Domain], [ExcludeEvents])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignEventExclusions_VersionID]
  ON [email].[EventExclusions] ([VersionId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[EventExclusions]
  ADD CONSTRAINT [FK_EventExclusions_Versions] FOREIGN KEY ([VersionId]) REFERENCES [email].[Versions] ([Id]) ON DELETE CASCADE
GO