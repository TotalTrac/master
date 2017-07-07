CREATE TABLE [email].[Forwards] (
  [Id] [int] IDENTITY,
  [EmailAddress] [nvarchar](320) NOT NULL CONSTRAINT [DF_tblCampaignAddressForwards_CAMPAIGNADDRESSFORWARD_ADDRESSEEID] DEFAULT (0),
  [Forwarded] [datetime] NOT NULL CONSTRAINT [DF_tblCampaignAddressForwards_CAMPAIGNADDRESSFORWARD_DATETIME] DEFAULT (getdate()),
  [ForwarderId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressForwards_CAMPAIGNADDRESSFORWARD_ADDRESSERID] DEFAULT (0),
  [IpAddress] [varbinary](8) NOT NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [SendStatus] [int] NOT NULL,
  [Sent] [datetime] NULL,
  [VersionId] [int] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_tblCampaignAddressForwards] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressForwards_CampaignVersion]
  ON [email].[Forwards] ([VersionId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressForwards_EmailAddress]
  ON [email].[Forwards] ([EmailAddress])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignAddressForwards_SendStatus]
  ON [email].[Forwards] ([SendStatus], [Sent])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CampaignAddressForwards_Uniqueness]
  ON [email].[Forwards] ([VersionId], [EmailAddress])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblCampaignAddressForwards]
  ON [email].[Forwards] ([ForwarderId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Forwards]
  ADD CONSTRAINT [FK_Forwards_Addresses] FOREIGN KEY ([ForwarderId]) REFERENCES [email].[Addresses] ([Id]) ON DELETE CASCADE
GO