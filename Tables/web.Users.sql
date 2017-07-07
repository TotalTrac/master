CREATE TABLE [web].[Users] (
  [USER_ID] [int] IDENTITY,
  [USER_ABANDONED] [bit] NULL,
  [USER_CODE] [nvarchar](20) NULL,
  [USER_ISGENERIC] [bit] NOT NULL,
  [USER_TARGETID] [int] NOT NULL,
  [USER_TYPE] [int] NOT NULL,
  [USER_URL] [nvarchar](100) NOT NULL,
  [USER_VERSIONID] [int] NOT NULL,
  [USER_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([USER_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

ALTER TABLE [web].[Users] WITH NOCHECK
  ADD CONSTRAINT [CK_Users_Url] CHECK (charindex(' ',[USER_URL])=(0) AND charindex('''',[USER_URL])=(0) AND charindex(':',[USER_URL])=(0) AND charindex('*',[USER_URL])=(0) AND charindex('"',[USER_URL])=(0))
GO

ALTER TABLE [web].[Users]
  NOCHECK CONSTRAINT [CK_Users_Url]
GO

CREATE UNIQUE INDEX [IX_Users_TargetID]
  ON [web].[Users] ([USER_TARGETID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_Users_VersionID]
  ON [web].[Users] ([USER_VERSIONID])
  INCLUDE ([USER_ABANDONED])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [web].[Users] WITH NOCHECK
  ADD CONSTRAINT [FK_Users_CampaignUsers] FOREIGN KEY ([USER_TARGETID]) REFERENCES [dbo].[CampaignUsers] ([Id]) ON DELETE CASCADE
GO