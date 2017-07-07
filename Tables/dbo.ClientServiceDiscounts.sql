CREATE TABLE [dbo].[ClientServiceDiscounts] (
  [DISCOUNT_ID] [int] IDENTITY,
  [DISCOUNT_CLIENTID] [int] NOT NULL,
  [DISCOUNT_PRICEMINIMUM] [decimal](18, 5) NULL,
  [DISCOUNT_PERCENT] [decimal](7, 5) NULL,
  [DISCOUNT_SERVICEID] [int] NOT NULL,
  [DISCOUNT_UNITPRICE] [decimal](18, 5) NULL,
  [DISCOUNT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_tblClientServiceDiscounts] PRIMARY KEY CLUSTERED ([DISCOUNT_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_ClientServiceDiscounts_Uniqueness]
  ON [dbo].[ClientServiceDiscounts] ([DISCOUNT_CLIENTID], [DISCOUNT_SERVICEID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblClientServiceDiscountsClientID]
  ON [dbo].[ClientServiceDiscounts] ([DISCOUNT_CLIENTID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblClientServiceDiscountsServiceID]
  ON [dbo].[ClientServiceDiscounts] ([DISCOUNT_SERVICEID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClientServiceDiscounts]
  ADD CONSTRAINT [FK_ClientServiceDiscounts_Clients] FOREIGN KEY ([DISCOUNT_CLIENTID]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ClientServiceDiscounts]
  ADD CONSTRAINT [FK_ClientServiceDiscounts_Services] FOREIGN KEY ([DISCOUNT_SERVICEID]) REFERENCES [dbo].[Services] ([SERVICE_ID]) ON DELETE CASCADE
GO