CREATE TABLE [usps].[MailEventTypes] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_MailEventTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO