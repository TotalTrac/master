CREATE TABLE [dbo].[CampaignUsers] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [City] [nvarchar](30) NULL,
  [CompanyName] [nvarchar](100) NULL,
  [Country] [nvarchar](50) NULL,
  [EmailAddress] [nvarchar](320) NULL,
  [FirstName] [nvarchar](50) NULL,
  [IsSignoff] [bit] NOT NULL,
  [JobId] [int] NOT NULL,
  [LastName] [nvarchar](50) NULL,
  [Phone] [varchar](20) NULL,
  [PostalCode] [varchar](15) NULL,
  [Region] [nvarchar](30) NULL,
  [Salt] [nvarchar](50) NULL,
  [StreetAddress1] [nvarchar](100) NULL,
  [StreetAddress2] [nvarchar](100) NULL,
  [Title] [nvarchar](100) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_CampaignUsers] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignUsers_JobId]
  ON [dbo].[CampaignUsers] ([JobId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[CampaignUsers] WITH NOCHECK
  ADD CONSTRAINT [FK_CampaignUsers_Jobs] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID]) ON DELETE CASCADE
GO