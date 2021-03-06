﻿CREATE TABLE [dbo].[Assignments] (
  [ASSIGNMENT_ID] [int] IDENTITY,
  [ASSIGNMENT_JOBID] [int] NOT NULL,
  [ASSIGNMENT_USERID] [int] NOT NULL,
  [ASSIGNMENT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_tblAssignments] PRIMARY KEY CLUSTERED ([ASSIGNMENT_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Assignments]
  ON [dbo].[Assignments] ([ASSIGNMENT_JOBID], [ASSIGNMENT_USERID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblAssignments_JobID]
  ON [dbo].[Assignments] ([ASSIGNMENT_JOBID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_tblAssignments_UserID]
  ON [dbo].[Assignments] ([ASSIGNMENT_USERID])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[Assignments] WITH NOCHECK
  ADD CONSTRAINT [FK_Assignments_Jobs] FOREIGN KEY ([ASSIGNMENT_JOBID]) REFERENCES [dbo].[Jobs] ([JOB_ID]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Assignments]
  ADD CONSTRAINT [FK_Assignments_tblUsers] FOREIGN KEY ([ASSIGNMENT_USERID]) REFERENCES [dbo].[Users] ([USER_USERID]) ON DELETE CASCADE
GO