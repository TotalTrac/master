CREATE TABLE [dbo].[SubscriberStatuses] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  [Description] [varchar](max) NULL,
  CONSTRAINT [PK_SubscriberStatuses] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO