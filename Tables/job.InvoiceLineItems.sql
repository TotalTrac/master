CREATE TABLE [job].[InvoiceLineItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AdjustedPrice] [decimal](15, 5) NOT NULL,
  [InvoiceId] [int] NOT NULL,
  [Note] [varchar](max) NULL,
  [PerUnit] [int] NULL,
  [Quantity] [int] NOT NULL,
  [ServiceId] [int] NOT NULL,
  [State] [int] NULL,
  [Unit] [int] NULL,
  [UnitPrice] [decimal](15, 5) NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_InvoiceLineItems] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_InvoiceLineItems_InvoiceID]
  ON [job].[InvoiceLineItems] ([InvoiceId])
  ON [PRIMARY]
GO

ALTER TABLE [job].[InvoiceLineItems]
  ADD CONSTRAINT [FK_InvoiceLineItems_Invoices] FOREIGN KEY ([InvoiceId]) REFERENCES [job].[Invoices] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [job].[InvoiceLineItems] WITH NOCHECK
  ADD CONSTRAINT [FK_InvoiceLineItems_Services] FOREIGN KEY ([ServiceId]) REFERENCES [job].[Services] ([SERVICE_ID]) ON DELETE CASCADE
GO