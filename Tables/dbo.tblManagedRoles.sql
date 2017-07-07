CREATE TABLE [dbo].[tblManagedRoles] (
  [ROLEMGR_ID] [int] IDENTITY,
  [ROLEMGR_MGR_ID] [int] NOT NULL CONSTRAINT [DF_tblRoleManagers_ROLEMGR_MGR_ID] DEFAULT (0),
  [ROLEMGR_ROLE_ID] [int] NOT NULL CONSTRAINT [DF_tblRoleManagers_ROLEMGR_ROLE_ID] DEFAULT (0),
  CONSTRAINT [PK_tblRoleManagers] PRIMARY KEY CLUSTERED ([ROLEMGR_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblManagedRoles_ManagerID]
  ON [dbo].[tblManagedRoles] ([ROLEMGR_MGR_ID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblManagedRoles_RoleID]
  ON [dbo].[tblManagedRoles] ([ROLEMGR_ROLE_ID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO