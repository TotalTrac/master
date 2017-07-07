CREATE TABLE [dbo].[BillingCategories] (
  [Id] [int] IDENTITY,
  [CategoryId] [int] NULL,
  [ItemId] [int] NULL,
  [Name] [varchar](50) NULL,
  [Rowversion] [timestamp] NULL,
  CONSTRAINT [PK_BillingCategories] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingCategories]
  ADD CONSTRAINT [FK_BillingCategories_BillingItems_Id] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[BillingItems] ([Id]) ON DELETE CASCADE
GO