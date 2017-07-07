CREATE TABLE [usps].[PostageRefunds] (
  [Id] [int] IDENTITY,
  [AccountId] [int] NOT NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [Reason] [varchar](1000) NULL,
  [RefundAmount] [decimal](11, 2) NOT NULL,
  [RowVersion] [timestamp],
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[PostageRefunds]
  ADD FOREIGN KEY ([AccountId]) REFERENCES [usps].[PostageAccounts] ([Id])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Table for storing refunds from postage accounts.', 'SCHEMA', N'usps', 'TABLE', N'PostageRefunds'
GO