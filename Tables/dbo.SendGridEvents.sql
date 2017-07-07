CREATE TABLE [dbo].[SendGridEvents] (
  [Id] [int] IDENTITY,
  [Category] [varchar](100) NULL,
  [Email] [varchar](400) NOT NULL,
  [EventId] [varchar](100) NULL,
  [EventName] [varchar](50) NOT NULL,
  [GroupId] [int] NULL,
  [Ip] [varchar](50) NULL,
  [MessageId] [varchar](60) NOT NULL,
  [NewsletterId] [int] NULL,
  [Reason] [varchar](500) NULL,
  [Response] [varchar](50) NULL,
  [SendAt] [int] NULL,
  [SmtpId] [varchar](200) NULL,
  [Status] [varchar](50) NULL,
  [SystemId] [int] NULL,
  [TimeStamp] [int] NOT NULL,
  [Type] [varchar](50) NULL,
  [Url] [varchar](500) NULL,
  [UserAgent] [varchar](500) NULL,
  [Created] [datetime] NULL,
  [SendId] [int] NULL,
  CONSTRAINT [PK_SendGridEvents] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[SendGridEvents]
  ADD CONSTRAINT [FK_SendGridEvents_SendGridNewsletters_Id] FOREIGN KEY ([NewsletterId]) REFERENCES [dbo].[SendGridNewsletters] ([Id])
GO