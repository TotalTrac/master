CREATE TABLE [web].[Links] (
  [LINK_ID] [int] IDENTITY,
  [LINK_INDEX] [int] NOT NULL,
  [LINK_PAGEID] [int] NOT NULL,
  [LINK_TEXT] [nvarchar](200) NULL,
  [LINK_TITLE] [nvarchar](100) NULL,
  [LINK_URL] [nvarchar](500) NOT NULL,
  [LINK_ROWVERSION] [timestamp],
  CONSTRAINT [PK_PurlCampaignPageLinks] PRIMARY KEY CLUSTERED ([LINK_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_PurlCampaignPageLinks]
  ON [web].[Links] ([LINK_PAGEID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [web].[Links]
  ADD CONSTRAINT [FK_Links_Pages] FOREIGN KEY ([LINK_PAGEID]) REFERENCES [web].[Pages] ([PAGE_ID]) ON DELETE CASCADE
GO