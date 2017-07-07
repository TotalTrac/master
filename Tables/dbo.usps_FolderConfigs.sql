CREATE TABLE [dbo].[usps_FolderConfigs] (
  [Id] [int] IDENTITY,
  [ClientId] [int] NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [IsActive] [bit] NOT NULL,
  [LettershopId] [int] NOT NULL,
  [Path] [nvarchar](4000) NOT NULL,
  [ValidationFlags] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_usps_FolderConfig] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_usps_FolderConfigs_Uniqueness]
  ON [dbo].[usps_FolderConfigs] ([ClientId], [LettershopId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[usps_FolderConfigs]
  ADD CONSTRAINT [FK_usps_FolderConfig_Clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[usps_FolderConfigs]
  ADD CONSTRAINT [FK_usps_FolderConfig_Clients1] FOREIGN KEY ([LettershopId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[usps_FolderConfigs]
  ADD CONSTRAINT [FK_usps_FolderConfigs_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO