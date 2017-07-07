CREATE TABLE [job].[Punches] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [MachineName] [nvarchar](100) NOT NULL,
  [JobId] [int] NOT NULL,
  [StartTime] [datetime] NOT NULL,
  [StopTime] [datetime] NULL,
  [UserName] [nvarchar](100) NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Punches] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Punches_JobID]
  ON [job].[Punches] ([JobId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Punches_Username]
  ON [job].[Punches] ([UserName])
  ON [PRIMARY]
GO

ALTER TABLE [job].[Punches]
  ADD CONSTRAINT [FK_Punches_Jobs] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID]) ON DELETE CASCADE
GO