CREATE TABLE [email].[Versions] (
  [Id] [int] IDENTITY,
  [AutoResponseAlternateDay] [int] NULL,
  [AutoResponseDays] [int] NULL,
  [AutoResponseDontSend] [int] NULL,
  [AutoResponseTime] [time](0) NULL,
  [FromAddress] [nvarchar](320) NOT NULL,
  [FromDisplayName] [nvarchar](50) NOT NULL,
  [JobId] [int] NOT NULL,
  [LinksRegistered] [datetime] NULL,
  [MarkupText] [nvarchar](max) NULL CONSTRAINT [DF_tblCampaignVersions_CAMPAIGNVERSION_MARKUPURL] DEFAULT (''),
  [Name] [nvarchar](100) NULL,
  [PlainText] [nvarchar](max) NULL CONSTRAINT [DF_tblCampaignVersions_CAMPAIGNVERSION_TEXTURL] DEFAULT (''),
  [ReplyToAddress] [nvarchar](320) NOT NULL,
  [ReturnPathAddress] [nvarchar](320) NOT NULL,
  [SubjectLine] [nvarchar](100) NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_CampaignVersions] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_Versions_JobId]
  ON [email].[Versions] ([JobId])
  ON [PRIMARY]
GO