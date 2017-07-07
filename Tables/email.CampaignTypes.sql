CREATE TABLE [email].[CampaignTypes] (
  [Id] [int] IDENTITY,
  [Name] [nchar](50) NOT NULL,
  CONSTRAINT [PK_CampaignTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO