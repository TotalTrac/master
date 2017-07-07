CREATE TABLE [dbo].[email_ResponseCodes] (
  [Id] [int] IDENTITY,
  [Code] [nvarchar](20) NULL,
  [Meaning] [nvarchar](1024) NULL,
  [Spam] [nvarchar](5) NULL
)
ON [PRIMARY]
GO