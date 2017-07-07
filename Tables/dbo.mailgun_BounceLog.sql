CREATE TABLE [dbo].[mailgun_BounceLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AttachmentCount] [int] NULL,
  [BodyPlainText] [varchar](4000) NULL,
  [CampaignId] [varchar](500) NULL,
  [Code] [varchar](100) NULL,
  [CustomData] [varchar](4000) NULL,
  [Domain] [varchar](4000) NULL,
  [Error] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [MailingList] [varchar](500) NULL,
  [MessageHeaders] [varchar](4000) NULL,
  [MessageId] [varchar](500) NULL,
  [Notification] [varchar](500) NULL,
  [Recipient] [varchar](1000) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](1000) NULL,
  [TimeStamp] [varchar](50) NULL,
  [Token] [varchar](50) NULL,
  [Tag] [varchar](500) NULL,
  [XMailGunSid] [varchar](100) NULL,
  CONSTRAINT [PK_email_BounceLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO