CREATE TABLE [dbo].[CampaignUserFields] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [nvarchar](100) NOT NULL,
  [UserId] [int] NOT NULL,
  [Value] [sql_variant] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_CampaignUserFields] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_CampaignUserFields_UserIdName]
  ON [dbo].[CampaignUserFields] ([UserId], [Name])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[CampaignUserFields]
  ADD CONSTRAINT [FK_CampaignUserFields_CampaignUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[CampaignUsers] ([Id]) ON DELETE CASCADE
GO