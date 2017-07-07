CREATE TABLE [dbo].[mailjet_Blocked] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [EventId] [int] NOT NULL,
  [error_related_to] [varchar](50) NULL,
  [error] [varchar](50) NULL,
  CONSTRAINT [PK_mailjet_Blocked] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[mailjet_Blocked]
  ADD CONSTRAINT [FK_mailjet_Blocked_mailjet_Event_Id] FOREIGN KEY ([EventId]) REFERENCES [dbo].[mailjet_Event] ([Id])
GO