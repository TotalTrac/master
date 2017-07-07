CREATE TABLE [dbo].[audit_Entries] (
  [ActionId] [int] NOT NULL,
  [DateTime] [datetime] NOT NULL,
  [IsRolledBack] [bit] NOT NULL,
  [ObjectId] [int] NULL,
  [ObjectState] [nvarchar](max) NOT NULL,
  [ObjectType] [varchar](200) NOT NULL,
  [UserId] [int] NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_AuditEntries]
  ON [dbo].[audit_Entries] ([DateTime], [ObjectId], [ObjectType])
  ON [PRIMARY]
GO

CREATE INDEX [IX_AuditEntries_ObjectIDObjectType]
  ON [dbo].[audit_Entries] ([ObjectId], [ObjectType])
  INCLUDE ([ActionId], [DateTime], [IsRolledBack], [ObjectState], [UserId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[audit_Entries]
  ADD CONSTRAINT [FK_Entries_Actions] FOREIGN KEY ([ActionId]) REFERENCES [dbo].[audit_Actions] ([Id])
GO

ALTER TABLE [dbo].[audit_Entries]
  ADD CONSTRAINT [FK_Entries_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO