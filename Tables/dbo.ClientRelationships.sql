CREATE TABLE [dbo].[ClientRelationships] (
  [Id] [int] IDENTITY,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [DisabledDate] [datetime] NULL,
  [Expiration] [datetime] NULL,
  [ParentClientId] [int] NOT NULL,
  [PartnerClientId] [int] NOT NULL,
  [RelationshipState] [int] NULL,
  [RelationshipType] [int] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_ClientRelationships] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClientRelationships]
  ADD CONSTRAINT [FK_ClientRelationships_ClientRelationshipState_Id] FOREIGN KEY ([RelationshipState]) REFERENCES [dbo].[ClientRelationshipState] ([Id])
GO

ALTER TABLE [dbo].[ClientRelationships]
  ADD CONSTRAINT [FK_ClientRelationships_Clients_CLIENT_ID] FOREIGN KEY ([ParentClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[ClientRelationships]
  ADD CONSTRAINT [FK_ClientRelationships_PartnerClients_CLIENT_ID] FOREIGN KEY ([PartnerClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[ClientRelationships]
  ADD CONSTRAINT [FK_ClientRelationships_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO