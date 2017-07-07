CREATE TABLE [dbo].[BillingMethod] (
  [Id] [int] NOT NULL,
  [Name] [varchar](50) NOT NULL,
  CONSTRAINT [PK_BillingMethod] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO