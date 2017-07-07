CREATE TABLE [usps].[Mailers] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [ClientId] [int] NOT NULL,
  [IsDefaultTrackingId] [bit] NOT NULL,
  [IsManaged] [bit] NULL,
  [IsTrackingRegistered] [bit] NOT NULL,
  [MailerID] [char](9) NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_MailerIDs] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailerIDs_ClientID]
  ON [usps].[Mailers] ([ClientId])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[Mailers]
  ADD CONSTRAINT [FK_Mailers_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO