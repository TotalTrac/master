CREATE TABLE [email].[Approvals] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Approved] [datetime] NULL,
  [IpAddress] [varbinary](8) NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [Key] [uniqueidentifier] NOT NULL,
  [SendId] [int] NOT NULL CONSTRAINT [DF_tblCampaignVersionApprovals_CAMPAIGNVERSIONAPPROVAL_USERID] DEFAULT (0),
  [Rowversion] [timestamp],
  CONSTRAINT [PK_Approvals] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Approvals_SendID]
  ON [email].[Approvals] ([SendId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [email].[Approvals]
  ADD CONSTRAINT [FK_Approvals_Sends] FOREIGN KEY ([SendId]) REFERENCES [email].[Sends] ([Id]) ON DELETE CASCADE
GO