CREATE TABLE [job].[ClientSageCustomers] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [SageCustomerId] [varchar](10) NULL,
  CONSTRAINT [PK_ClientSageCustomers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[ClientSageCustomers] WITH NOCHECK
  ADD CONSTRAINT [FK_ClientSageCustomers_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO