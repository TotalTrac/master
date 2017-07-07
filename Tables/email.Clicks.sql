CREATE TABLE [email].[Clicks] (
  [Id] [int] IDENTITY,
  [AddressId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressClicks_CAMPAIGNADDRESSCLICK_CAMPAIGNADDRESSID] DEFAULT (0),
  [DateTime] [datetime] NOT NULL CONSTRAINT [DF_tblCampaignAddressClicks_CAMPAIGNADDRESSCLICK_DATETIME] DEFAULT (getdate()),
  [IpAddress] [varbinary](8) NOT NULL CONSTRAINT [DF_tblCampaignAddressClicks_CAMPAIGNADDRESSCLICK_IPADDRESS] DEFAULT (0),
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [LinkId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressClicks_CAMPAIGNADDRESSCLICK_CAMPAIGNVERSIONLINKID] DEFAULT (0),
  [SessionId] [char](24) NULL,
  [UserAgent] [nvarchar](4000) NULL,
  CONSTRAINT [PK_tblCampaignAddressClicks] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressClicks_CampaignAddressID]
  ON [email].[Clicks] ([AddressId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressClicks_CampaignVersionLinkID]
  ON [email].[Clicks] ([LinkId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressClicks_DateTime]
  ON [email].[Clicks] ([DateTime])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Clicks]
  ADD CONSTRAINT [FK_Clicks_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [email].[Addresses] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [email].[Clicks]
  ADD CONSTRAINT [FK_Clicks_Links] FOREIGN KEY ([LinkId]) REFERENCES [email].[Links] ([Id]) ON DELETE CASCADE
GO