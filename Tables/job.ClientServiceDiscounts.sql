CREATE TABLE [job].[ClientServiceDiscounts] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [PriceMinimum] [decimal](18, 5) NULL,
  [Percent] [decimal](7, 5) NULL,
  [ServiceId] [int] NOT NULL,
  [UnitPrice] [decimal](18, 5) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblClientServiceDiscounts] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_ClientServiceDiscounts_Uniqueness]
  ON [job].[ClientServiceDiscounts] ([ClientId], [ServiceId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblClientServiceDiscountsClientID]
  ON [job].[ClientServiceDiscounts] ([ClientId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblClientServiceDiscountsServiceID]
  ON [job].[ClientServiceDiscounts] ([ServiceId])
  ON [PRIMARY]
GO

ALTER TABLE [job].[ClientServiceDiscounts]
  ADD CONSTRAINT [FK_ClientServiceDiscounts_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[ClientServiceDiscounts]
  ADD CONSTRAINT [FK_ClientServiceDiscounts_Services] FOREIGN KEY ([ServiceId]) REFERENCES [dbo].[Services] ([SERVICE_ID]) ON DELETE CASCADE
GO