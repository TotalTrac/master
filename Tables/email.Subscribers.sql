CREATE TABLE [email].[Subscribers] (
  [Id] [int] IDENTITY,
  [Active] [bit] NOT NULL,
  [ClientId] [int] NOT NULL,
  [CustomField1] [sql_variant] SPARSE NULL,
  [CustomField2] [sql_variant] SPARSE NULL,
  [CustomField3] [sql_variant] SPARSE NULL,
  [CustomField4] [sql_variant] SPARSE NULL,
  [CustomField5] [sql_variant] SPARSE NULL,
  [EmailAddress] [nvarchar](320) NOT NULL,
  [FirstName] [nvarchar](50) NULL,
  [LastName] [nvarchar](50) NULL,
  [Subscribed] [datetime] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_CampaignSubscribers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignSubscribers_ClientID]
  ON [email].[Subscribers] ([ClientId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignSubscribers_EmailAddress]
  ON [email].[Subscribers] ([EmailAddress])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CampaignSubscribers_Uniqueness]
  ON [email].[Subscribers] ([ClientId], [EmailAddress])
  ON [PRIMARY]
GO

ALTER TABLE [email].[Subscribers]
  ADD CONSTRAINT [FK_CampaignSubscribers_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO