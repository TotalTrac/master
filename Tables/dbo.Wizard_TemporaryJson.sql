CREATE TABLE [dbo].[Wizard_TemporaryJson] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NOT NULL,
  [Json] [varchar](max) NOT NULL,
  [UserId] [int] NOT NULL,
  CONSTRAINT [PK_Wizard_TemporaryJson] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Wizard_TemporaryJson]
  ADD CONSTRAINT [FK_Wizard_TemporaryJson_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[Wizard_TemporaryJson]
  ADD CONSTRAINT [FK_Wizard_TemporaryJson_Users_USER_USERID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO