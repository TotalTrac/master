CREATE TABLE [dbo].[mailjet_Event] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [event] [varchar](50) NULL,
  [time] [varchar](50) NULL,
  [MessageId] [varchar](500) NULL,
  [email] [varchar](500) NULL,
  [mj_campaign_id] [int] NULL,
  [mj_contact_id] [int] NULL,
  [customcampaign] [varchar](50) NULL,
  [CustomID] [varchar](50) NULL,
  [Payload] [varchar](4000) NULL,
  [SendId] [int] NULL,
  CONSTRAINT [PK_mailjet_Event] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO