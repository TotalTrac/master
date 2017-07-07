CREATE TABLE [dbo].[Subscribers] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Active] [bit] NOT NULL DEFAULT (1),
  [FirstName] [varchar](50) NULL,
  [LastName] [varchar](50) NULL,
  [ClientId] [int] NOT NULL,
  [Subscribed] [datetime] NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Subscribers]
  ADD CONSTRAINT [FK_Subscribers_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO