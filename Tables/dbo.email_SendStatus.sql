CREATE TABLE [dbo].[email_SendStatus] (
  [Id] [int] NOT NULL,
  [CanRetry] [bit] NOT NULL,
  [IsError] [bit] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_email_SendStatus] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO