CREATE TABLE [dbo].[ProjectJobs] (
  [PROJECTJOB_PROJECTID] [int] NOT NULL,
  [PROJECTJOB_JOBID] [int] NOT NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ProjectJobs_JobID]
  ON [dbo].[ProjectJobs] ([PROJECTJOB_JOBID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_ProjectJobs_ProjectID]
  ON [dbo].[ProjectJobs] ([PROJECTJOB_PROJECTID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_ProjectJobs_Uniqueness]
  ON [dbo].[ProjectJobs] ([PROJECTJOB_PROJECTID], [PROJECTJOB_JOBID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProjectJobs]
  ADD CONSTRAINT [FK_ProjectJobs_Projects] FOREIGN KEY ([PROJECTJOB_PROJECTID]) REFERENCES [dbo].[Projects] ([PROJECT_ID]) ON DELETE CASCADE
GO