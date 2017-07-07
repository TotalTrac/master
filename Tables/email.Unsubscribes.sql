CREATE TABLE [email].[Unsubscribes] (
  [Id] [int] IDENTITY,
  [AddressId] [int] NOT NULL,
  [DateTime] [datetime] NOT NULL CONSTRAINT [DF_tblCampaignAddressUnsubscribes_CAMPAIGNADDRESSUNSUBSCRIBE_DATETIME] DEFAULT (getdate()),
  [IpAddress] [varbinary](8) NOT NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  CONSTRAINT [PK_tblCampaignAddressUnsubscribes] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_tblCampaignAddressUnsubscribes]
  ON [email].[Unsubscribes] ([AddressId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Unsubscribes]
  ADD CONSTRAINT [FK_Unsubscribes_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [email].[Addresses] ([Id]) ON DELETE CASCADE
GO