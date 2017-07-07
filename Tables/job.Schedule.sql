CREATE TABLE [job].[Schedule] (
  [Id] [int] IDENTITY,
  [ScheduledStartTime] [datetime] NOT NULL,
  [ExpectedEndTime] [datetime] NOT NULL,
  [Notes] [varchar](5000) NULL,
  [RowVersion] [timestamp],
  [Title] [varchar](100) NULL,
  CONSTRAINT [PK_SetupSchedule_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO