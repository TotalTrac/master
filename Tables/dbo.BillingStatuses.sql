CREATE TABLE [dbo].[BillingStatuses] (
  [Id] [int] NOT NULL,
  [Name] [varchar](50) NOT NULL,
  CONSTRAINT [PK_BillingStatuses] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO