CREATE TABLE [email].[Sends] (
  [Id] [int] IDENTITY,
  [AddressId] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressSends_CAMPAIGNADDRESSSEND_CAMPAIGNADDRESSID] DEFAULT (0),
  [Send] [datetime] NOT NULL,
  [Sent] [datetime] NULL,
  [Status] [int] NOT NULL CONSTRAINT [DF_tblCampaignAddressSends_CAMPAIGNADDRESSSEND_STATUS] DEFAULT (0),
  [Rowversion] [timestamp],
  CONSTRAINT [PK_Sends] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Sends_AddressID]
  ON [email].[Sends] ([AddressId])
  INCLUDE ([Status])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_Sends_Pending]
  ON [email].[Sends] ([Status], [Send])
  INCLUDE ([Id])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Sends]
  ADD CONSTRAINT [FK_Sends_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [email].[Addresses] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [email].[Sends]
  ADD CONSTRAINT [FK_Sends_email_SendStatus] FOREIGN KEY ([Status]) REFERENCES [dbo].[email_SendStatus] ([Id])
GO