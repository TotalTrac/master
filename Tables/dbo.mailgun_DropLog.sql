CREATE TABLE [dbo].[mailgun_DropLog] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Code] [varchar](500) NULL,
  [Description] [varchar](1000) NULL,
  [Domain] [varchar](500) NULL,
  [Event] [varchar](50) NULL,
  [MessageHeaders] [varchar](4000) NULL,
  [MessageId] [varchar](100) NULL,
  [Reason] [varchar](500) NULL,
  [Recipient] [varchar](500) NULL,
  [SendId] [int] NULL,
  [Signature] [varchar](500) NULL,
  [Timestamp] [varchar](50) NULL,
  [Token] [varchar](50) NULL,
  CONSTRAINT [PK_table1] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO