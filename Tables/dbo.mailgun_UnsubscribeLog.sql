CREATE TABLE [dbo].[mailgun_UnsubscribeLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [BodyPlainText] [varchar](4000) NULL,
  [CampaignId] [varchar](50) NULL,
  [CampaignName] [varchar](500) NULL,
  [City] [varchar](500) NULL,
  [ClientName] [varchar](50) NULL,
  [ClientOs] [varchar](50) NULL,
  [ClientType] [varchar](50) NULL,
  [Country] [varchar](500) NULL,
  [DeviceType] [varchar](50) NULL,
  [Domain] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [Ip] [varchar](50) NULL,
  [MailingList] [varchar](500) NULL,
  [Recipient] [varchar](500) NULL,
  [Region] [varchar](500) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](500) NULL,
  [Tag] [varchar](100) NULL,
  [Timestamp] [varchar](50) NULL,
  [Token] [varchar](100) NULL,
  [UserAgent] [varchar](500) NULL,
  CONSTRAINT [PK_email_UnsubscribeLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO