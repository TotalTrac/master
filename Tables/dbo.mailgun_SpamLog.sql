CREATE TABLE [dbo].[mailgun_SpamLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [CampaignId] [varchar](50) NULL,
  [CampaignName] [varchar](500) NULL,
  [Domain] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [MailingList] [varchar](500) NULL,
  [MessageHeaders] [varchar](4000) NULL,
  [MessageId] [varchar](100) NULL,
  [Recipient] [varchar](500) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](500) NULL,
  [Tag] [varchar](100) NULL,
  [TimeStamp] [varchar](50) NULL,
  [Token] [varchar](100) NULL,
  CONSTRAINT [PK_email_SpamLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO