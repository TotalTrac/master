CREATE TABLE [dbo].[BillingInvoice] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [Amount] [decimal](18, 4) NULL,
  [ClientId] [int] NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [InvoiceBeginDate] [datetime] NOT NULL,
  [InvoiceEndDate] [datetime] NULL,
  [Usage] [int] NULL,
  [PaymentStatus] [int] NOT NULL,
  [ProviderInvoiceId] [int] NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_BillingInvoice_1] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingInvoice]
  ADD CONSTRAINT [FK_BillingInvoice_BillingStatuses_Id] FOREIGN KEY ([PaymentStatus]) REFERENCES [dbo].[BillingStatuses] ([Id])
GO

ALTER TABLE [dbo].[BillingInvoice]
  ADD CONSTRAINT [FK_BillingInvoice_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[BillingInvoice]
  ADD CONSTRAINT [FK_BillingInvoice_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO