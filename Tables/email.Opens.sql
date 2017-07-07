CREATE TABLE [email].[Opens] (
  [Id] [int] IDENTITY,
  [AddressId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressOpens_CAMPAIGNADDRESSOPEN_CAMPAIGNADDRESSID] DEFAULT (0),
  [DateTime] [datetime] NOT NULL CONSTRAINT [DF_tblCampaignAddressOpens_CAMPAIGNADDRESSOPEN_DATETIME] DEFAULT (getdate()),
  [IpAddress] [varbinary](8) NOT NULL CONSTRAINT [DF_tblCampaignAddressOpens_CAMPAIGNADDRESSOPEN_IPADDRESS] DEFAULT (0),
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [SessionId] [char](24) NULL,
  [UserAgent] [nvarchar](4000) NULL,
  CONSTRAINT [PK_CampaignAddressOpens] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressOpens_CampaignAddressID]
  ON [email].[Opens] ([AddressId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressOpens_DateTime]
  ON [email].[Opens] ([DateTime])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Opens]
  ADD CONSTRAINT [FK_Opens_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [email].[Addresses] ([Id]) ON DELETE CASCADE
GO