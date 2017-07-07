CREATE TABLE [email].[Addresses] (
  [Id] [int] IDENTITY,
  [MarkupText] [nvarchar](max) NULL,
  [PlainText] [nvarchar](max) NULL,
  [TargetId] [int] NULL,
  [Type] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddresses_CAMPAIGNADDRESS_TYPE] DEFAULT (0),
  [VersionId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddresses_CAMPAIGNADDRESS_CAMPAIGNVERSIONID] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Addresses_TargetID]
  ON [email].[Addresses] ([TargetId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Addresses_VersionID]
  ON [email].[Addresses] ([VersionId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Addresses] WITH NOCHECK
  ADD CONSTRAINT [FK_Addresses_CampaignUsers] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[CampaignUsers] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [email].[Addresses]
  ADD CONSTRAINT [FK_Addresses_Versions] FOREIGN KEY ([VersionId]) REFERENCES [email].[Versions] ([Id]) ON DELETE CASCADE
GO