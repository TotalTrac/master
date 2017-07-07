CREATE TABLE [dbo].[SendGridNewsletters] (
  [Id] [int] IDENTITY,
  [NewsletterUserListId] [int] NULL,
  [NewsletterSendId] [int] NULL,
  CONSTRAINT [PK_SendGridNewsletters] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO