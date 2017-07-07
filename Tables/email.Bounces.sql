CREATE TABLE [email].[Bounces] (
  [Id] [int] IDENTITY,
  [SendId] [int] NULL,
  [Data] [varbinary](max) NULL,
  [DateTime] [datetime] NOT NULL CONSTRAINT [DF_tblCampaignAddressBounces_CAMPAIGNADDRESSBOUNCE_DATETIME] DEFAULT (getdate()),
  [Type] [int] NOT NULL CONSTRAINT [DF_CampaignAddressBounces_CAMPAIGNADDRESSBOUNCE_TYPE] DEFAULT (0),
  CONSTRAINT [PK_CampaignAddressBounces] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressBounces_CampaignAddressID]
  ON [email].[Bounces] ([SendId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CampaignAddressBounces_Uniqueness]
  ON [email].[Bounces] ([SendId], [DateTime], [Type])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Bounces]
  ADD CONSTRAINT [FK_Bounces_Sends] FOREIGN KEY ([SendId]) REFERENCES [email].[Sends] ([Id])
GO