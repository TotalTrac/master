﻿CREATE TABLE [dbo].[BulkServiceDiscounts] (
  [DISCOUNT_ID] [int] IDENTITY,
  [DISCOUNT_HIGHTHRESHOLD] [int] NULL,
  [DISCOUNT_LOWTHRESHOLD] [int] NULL,
  [DISCOUNT_PERCENT] [decimal](7, 5) NULL,
  [DISCOUNT_SERVICEID] [int] NOT NULL,
  [DISCOUNT_UNITPRICE] [decimal](18, 5) NULL,
  [DISCOUNT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_tblBulkServiceDiscounts] PRIMARY KEY CLUSTERED ([DISCOUNT_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblBulkServiceDiscountsServiceID]
  ON [dbo].[BulkServiceDiscounts] ([DISCOUNT_SERVICEID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[BulkServiceDiscounts]
  ADD CONSTRAINT [FK_BulkServiceDiscounts_Services] FOREIGN KEY ([DISCOUNT_SERVICEID]) REFERENCES [dbo].[Services] ([SERVICE_ID]) ON DELETE CASCADE
GO