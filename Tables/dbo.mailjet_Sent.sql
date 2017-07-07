CREATE TABLE [dbo].[mailjet_Sent] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [EventId] [int] NOT NULL,
  [mj_message_id] [varchar](50) NULL,
  [smtp_reply] [varchar](50) NULL,
  CONSTRAINT [PK_mailjet_Sent] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[mailjet_Sent]
  ADD CONSTRAINT [FK_mailjet_Sent_mailjet_Event_Id] FOREIGN KEY ([EventId]) REFERENCES [dbo].[mailjet_Event] ([Id])
GO