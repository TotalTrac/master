CREATE TABLE [dbo].[_MailgunSuppressions] (
  [Address] [nvarchar](320) NOT NULL,
  [Code] [int] NOT NULL,
  [Error] [nvarchar](max) NOT NULL,
  [DateTime] [nvarchar](max) NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO