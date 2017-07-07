CREATE TABLE [usps].[PostageReceipts] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AccountId] [int] NOT NULL,
  [AmountReceived] [decimal](11, 2) NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Notes] [nvarchar](1000) NULL,
  [Received] [date] NOT NULL,
  [ReceivedBy] [int] NOT NULL,
  [Reference] [nvarchar](50) NULL,
  [TypeId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_PostageRecipts] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[PostageReceipts]
  ADD CONSTRAINT [FK_PostageReceipts_PostageAccounts_Id] FOREIGN KEY ([AccountId]) REFERENCES [usps].[PostageAccounts] ([Id])
GO

ALTER TABLE [usps].[PostageReceipts]
  ADD CONSTRAINT [FK_PostageReceipts_PostageReceiptTypes_Id] FOREIGN KEY ([TypeId]) REFERENCES [usps].[PostageReceiptTypes] ([Id])
GO