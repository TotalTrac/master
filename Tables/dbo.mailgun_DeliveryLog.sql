CREATE TABLE [dbo].[mailgun_DeliveryLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [BodyPlainText] [varchar](4000) NULL,
  [Domain] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [MessageHeaders] [varchar](4000) NULL,
  [MessageId] [varchar](500) NULL,
  [Recipient] [varchar](500) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](100) NULL,
  [Timestamp] [varchar](50) NULL,
  [Token] [varchar](100) NULL,
  CONSTRAINT [PK_email_DeliveryLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO