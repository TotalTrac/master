CREATE TABLE [dbo].[RelationshipCreationRequests] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [ClientCreationRequestId] [int] NOT NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [State] [int] NOT NULL,
  [UserId] [int] NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_RelationshipCreationRequests] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[RelationshipCreationRequests]
  ADD CONSTRAINT [FK_RelationshipCreationRequests_ClientCreationRequests_Id] FOREIGN KEY ([ClientCreationRequestId]) REFERENCES [dbo].[ClientCreationRequests] ([Id])
GO

ALTER TABLE [dbo].[RelationshipCreationRequests]
  ADD CONSTRAINT [FK_RelationshipCreationRequests_CreationRequestStateTypes_Id] FOREIGN KEY ([State]) REFERENCES [dbo].[CreationRequestStateTypes] ([Id])
GO

ALTER TABLE [dbo].[RelationshipCreationRequests]
  ADD CONSTRAINT [FK_RelationshipCreationRequests_Users_CreatedBy_USER_USERID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO

ALTER TABLE [dbo].[RelationshipCreationRequests]
  ADD CONSTRAINT [FK_RelationshipCreationRequests_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO