﻿CREATE TABLE [dbo].[Jobs] (
  [JOB_ID] [int] IDENTITY,
  [JOB_ACCESSIBILITYLEVEL] [int] NOT NULL,
  [JOB_CAMPAIGNID] [int] NULL,
  [JOB_COMMENTTHREADID] [int] NULL,
  [JOB_COMMINGLERJOBID] [int] NULL,
  [JOB_CONTACT] [nvarchar](100) NULL,
  [JOB_CREATED] [datetime] NOT NULL,
  [JOB_CREATEDBYID] [int] NOT NULL,
  [JOB_DATADUE] [date] NULL,
  [JOB_DROPDATE] [date] NULL,
  [JOB_ESTIMATEDQUANTITY] [int] NULL,
  [JOB_LETTERSHOPID] [int] NULL,
  [JOB_MATERIALDUE] [date] NULL,
  [JOB_NAME] [nvarchar](100) NOT NULL,
  [JOB_NOTES] [nvarchar](2000) NULL,
  [JOB_JOBID] [int] NOT NULL,
  [JOB_PONUMBER] [varchar](50) NULL,
  [JOB_PRIORITYID] [int] NOT NULL CONSTRAINT [DF_tblJobs_JOB_PRIORITY_ID] DEFAULT (0),
  [JOB_REFERENCE] [nvarchar](50) NULL,
  [JOB_SHORTNAME] [nvarchar](20) NULL,
  [JOB_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Mailings] PRIMARY KEY CLUSTERED ([JOB_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Mailings_ComminglerID]
  ON [dbo].[Jobs] ([JOB_COMMINGLERJOBID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Mailings_DropDate]
  ON [dbo].[Jobs] ([JOB_DROPDATE])
  INCLUDE ([JOB_ID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Mailings_NumberID]
  ON [dbo].[Jobs] ([JOB_JOBID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[Jobs] WITH NOCHECK
  ADD CONSTRAINT [FK_Jobs_AccessibilityLevels] FOREIGN KEY ([JOB_ACCESSIBILITYLEVEL]) REFERENCES [dbo].[AccessibilityLevels] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Jobs] WITH NOCHECK
  ADD CONSTRAINT [FK_Jobs_Mailings] FOREIGN KEY ([JOB_JOBID]) REFERENCES [job].[Jobs] ([JOB_ID]) ON DELETE CASCADE
GO