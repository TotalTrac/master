CREATE TABLE [dbo].[mailjet_Spam] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [EventId] [int] NOT NULL,
  [source] [varchar](50) NULL,
  CONSTRAINT [PK_mailjet_Spam] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[mailjet_Spam]
  ADD CONSTRAINT [FK_mailjet_Spam_mailjet_Event_Id] FOREIGN KEY ([EventId]) REFERENCES [dbo].[mailjet_Event] ([Id])
GO