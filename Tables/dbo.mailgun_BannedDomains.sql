CREATE TABLE [dbo].[mailgun_BannedDomains] (
  [Id] [int] IDENTITY,
  [Domain] [nvarchar](4000) NOT NULL,
  CONSTRAINT [PK_email_BannedDomains] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO