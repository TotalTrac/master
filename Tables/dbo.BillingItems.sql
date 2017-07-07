CREATE TABLE [dbo].[BillingItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [ItemId] [int] NULL,
  [ItemType] [varchar](500) NULL,
  [TiersetId] [int] NULL,
  [Name] [varchar](500) NULL,
  [Description] [varchar](500) NULL,
  [Units] [varchar](50) NULL,
  [Enabled] [bit] NULL,
  [AccountingSku] [varchar](500) NULL,
  [Token] [varchar](50) NULL,
  [Custom1] [varchar](500) NULL,
  [Custom2] [varchar](500) NULL,
  [Custom3] [varchar](500) NULL,
  [WriteDateTime] [datetime] NULL,
  [ModDateTime] [datetime] NULL,
  [UnitsPlural] [varchar](50) NULL,
  [ExpireRecurs] [varchar](50) NULL,
  [TrialRecurs] [varchar](50) NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_BillingItems] PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
GO