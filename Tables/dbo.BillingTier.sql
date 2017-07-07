CREATE TABLE [dbo].[BillingTier] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [TierId] [int] NULL,
  [TiersetId] [int] NULL,
  [UnitFrom] [decimal](18, 4) NULL,
  [UnitTo] [decimal](18, 4) NULL,
  [Amount] [decimal](18, 4) NULL,
  [Rowversion] [timestamp] NULL,
  CONSTRAINT [PK_BillingTier] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingTier]
  ADD CONSTRAINT [FK_BillingTier_BillingItems_Id] FOREIGN KEY ([TiersetId]) REFERENCES [dbo].[BillingTiersets] ([Id]) ON DELETE CASCADE
GO