CREATE TABLE [dbo].[ClientInvitation] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [ClientId] [int] NOT NULL,
  [ClientTypeId] [int] NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Expiration] [datetime] NULL,
  [InvitationState] [int] NOT NULL,
  [PartnerClientId] [int] NULL,
  [PartnerEmail] [nvarchar](200) NOT NULL,
  [PlacesId] [varchar](500) NULL,
  [RelationshipType] [int] NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_ClientInvitation] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClientInvitation]
  ADD CONSTRAINT [FK_ClientInvitation_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[ClientInvitation]
  ADD CONSTRAINT [FK_ClientInvitation_InvitationClientTypes_Id] FOREIGN KEY ([ClientTypeId]) REFERENCES [dbo].[InvitationClientTypes] ([Id])
GO

ALTER TABLE [dbo].[ClientInvitation]
  ADD CONSTRAINT [FK_ClientInvitation_PartnerClients_CLIENT_ID] FOREIGN KEY ([PartnerClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[ClientInvitation]
  ADD CONSTRAINT [FK_ClientInvitation_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO