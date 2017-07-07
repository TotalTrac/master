CREATE TABLE [email].[Campaigns] (
  [Id] [int] IDENTITY,
  [CampaignId] [int] NULL,
  [ClientId] [int] NOT NULL CONSTRAINT [DF_tblCampaigns_CAMPAIGN_CLIENTID] DEFAULT (0),
  [Created] [datetime] NOT NULL CONSTRAINT [DF_tblCampaigns_CAMPAIGN_CREATED] DEFAULT (getdate()),
  [Name] [nvarchar](100) NOT NULL CONSTRAINT [DF_tblCampaigns_CAMPAIGN_NAME] DEFAULT (''),
  [Rowversion] [timestamp],
  CONSTRAINT [PK_tblCampaigns] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Campaigns_ClientID]
  ON [email].[Campaigns] ([ClientId])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Campaigns]
  ADD CONSTRAINT [FK_Campaigns_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO