CREATE TABLE [dbo].[BillingTiersets] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [TiersetId] [int] NULL,
  [CurrencyId] [int] NULL,
  [Setup] [decimal](18, 4) NULL,
  [Base] [decimal](18, 4) NULL,
  [Percent] [decimal](18, 4) NULL,
  [Paycycle] [varchar](500) NULL,
  [PriceModel] [varchar](500) NULL,
  [WriteDatetime] [datetime] NULL,
  [ModDatetime] [datetime] NULL,
  [CurrencySymbol] [varchar](50) NULL,
  [CurrencyIso4217] [varchar](50) NULL,
  [ItemId] [int] NULL,
  [SetupFormatted] [varchar](50) NULL,
  [BaseFormatted] [varchar](50) NULL,
  [PercentFormatted] [varchar](50) NULL,
  [PriceModelDesc] [varchar](500) NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_BillingTiersets] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingTiersets]
  ADD CONSTRAINT [FK_BillingTiersets_BillingItems_Id] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[BillingItems] ([Id]) ON DELETE CASCADE
GO