CREATE TABLE [web].[Buttons] (
  [BUTTON_ID] [int] IDENTITY,
  [BUTTON_NAME] [nvarchar](200) NOT NULL,
  [BUTTON_PAGEID] [int] NOT NULL,
  [BUTTON_TITLE] [nvarchar](100) NULL,
  [BUTTON_ROWVERSION] [timestamp],
  CONSTRAINT [PK_WebCampaignButtons] PRIMARY KEY CLUSTERED ([BUTTON_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_WebCampaignButtons_PageID]
  ON [web].[Buttons] ([BUTTON_PAGEID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_WebCampaignButtons_Uniqueness]
  ON [web].[Buttons] ([BUTTON_PAGEID], [BUTTON_TITLE])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO