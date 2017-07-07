CREATE TABLE [job].[Quotes] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Name] [nvarchar](100) NOT NULL,
  [Note] [varchar](max) NULL,
  [State] [int] NULL,
  [Updated] [datetime] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Quotes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_Quotes_ClientID]
  ON [job].[Quotes] ([ClientId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Quotes_UserID]
  ON [job].[Quotes] ([CreatedById])
  ON [PRIMARY]
GO

ALTER TABLE [job].[Quotes] WITH NOCHECK
  ADD CONSTRAINT [FK_Quotes_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [job].[Quotes] WITH NOCHECK
  ADD CONSTRAINT [FK_Quotes_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO