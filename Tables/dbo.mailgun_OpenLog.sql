CREATE TABLE [dbo].[mailgun_OpenLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [BodyPlainText] [varchar](4000) NULL,
  [CampaignId] [int] NULL,
  [CampaignName] [varchar](50) NULL,
  [City] [varchar](500) NULL,
  [ClientName] [varchar](50) NULL,
  [ClientOs] [varchar](500) NULL,
  [ClientType] [varchar](500) NULL,
  [Country] [varchar](50) NULL,
  [DeviceType] [varchar](500) NULL,
  [Domain] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [Ip] [varchar](50) NULL,
  [MailingList] [varchar](50) NULL,
  [Recipient] [varchar](500) NULL,
  [Region] [varchar](50) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](500) NULL,
  [Timestamp] [varchar](50) NULL,
  [Tag] [varchar](50) NULL,
  [Token] [varchar](500) NULL,
  [UserAgent] [varchar](500) NULL,
  CONSTRAINT [PK_email_OpenLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO