CREATE TABLE [dbo].[mailjet_Bounce] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [EventId] [int] NOT NULL,
  [blocked] [bit] NULL,
  [hard_bounce] [bit] NULL,
  [error_related_to] [varchar](50) NULL,
  [error] [varchar](50) NULL,
  CONSTRAINT [PK_mailjet_Bounce] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[mailjet_Bounce]
  ADD CONSTRAINT [FK_mailjet_Bounce_mailjet_Event_Id] FOREIGN KEY ([EventId]) REFERENCES [dbo].[mailjet_Event] ([Id])
GO