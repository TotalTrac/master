CREATE TABLE [usps].[PostageAccounts] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [Name] [varchar](500) NOT NULL,
  [RowVersion] [timestamp],
  PRIMARY KEY CLUSTERED ([Id]),
  UNIQUE ([ClientId], [Name])
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[PostageAccounts]
  ADD CONSTRAINT [FK__PostageAc__Clien__6EACF951] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Account For Tracking Postage used by jobs', 'SCHEMA', N'usps', 'TABLE', N'PostageAccounts'
GO