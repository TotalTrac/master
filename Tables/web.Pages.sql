﻿CREATE TABLE [web].[Pages] (
  [PAGE_ID] [int] IDENTITY,
  [PAGE_LINKSREGISTERED] [datetime] NULL,
  [PAGE_NAME] [nvarchar](50) NOT NULL,
  [PAGE_REQUESTTIMEOUT] [int] NOT NULL CONSTRAINT [DF_WebCampaignPages_WEBCAMPAIGNPAGE_REQUESTTIMEOUT] DEFAULT (0),
  [PAGE_TYPE] [int] NOT NULL CONSTRAINT [DF_WebCampaignPages_WEBCAMPAIGNPAGE_TYPE] DEFAULT (0),
  [PAGE_URL] [nvarchar](200) NOT NULL,
  [PAGE_VERSIONID] [int] NOT NULL,
  [PAGE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_PurlCampaignPages] PRIMARY KEY CLUSTERED ([PAGE_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_WebCampaignPages_Uniqueness]
  ON [web].[Pages] ([PAGE_URL])
  ON [PRIMARY]
GO

CREATE INDEX [IX_WebCampaignPages_VersionID]
  ON [web].[Pages] ([PAGE_VERSIONID])
  ON [PRIMARY]
GO

ALTER TABLE [web].[Pages]
  ADD CONSTRAINT [FK_Pages_Versions] FOREIGN KEY ([PAGE_VERSIONID]) REFERENCES [web].[Versions] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [web].[Pages]
  ADD CONSTRAINT [FK_Pages_web_PageTypes] FOREIGN KEY ([PAGE_TYPE]) REFERENCES [dbo].[web_PageTypes] ([Id])
GO