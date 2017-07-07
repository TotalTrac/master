CREATE TABLE [dbo].[CampaignUserFieldsStaging] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [nvarchar](100) NOT NULL,
  [UserId] [int] NOT NULL,
  [Value] [sql_variant] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_CampaignUserFieldsStaging] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO