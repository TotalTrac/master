CREATE TABLE [job].[SetupProcesses] (
  [Id] [int] IDENTITY,
  [UserId] [int] NULL,
  [MachineId] [int] NULL,
  [Notes] [varchar](5000) NULL,
  [ProcessTypeId] [int] NOT NULL,
  [ScheduledEndTime] [datetime] NULL,
  [ScheduledStartTime] [datetime] NULL,
  [StartTime] [datetime] NULL,
  [StopTime] [datetime] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupProcess_copy_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[SetupProcesses]
  ADD CONSTRAINT [FK_SetupProcess_Machines_Id_copy_copy_copy_copy_copy] FOREIGN KEY ([MachineId]) REFERENCES [job].[Machines] ([Id])
GO

ALTER TABLE [job].[SetupProcesses]
  ADD CONSTRAINT [FK_SetupProcess_SetupProcessType_Id_copy_copy_copy_copy_copy] FOREIGN KEY ([ProcessTypeId]) REFERENCES [job].[ProcessType] ([Id])
GO

ALTER TABLE [job].[SetupProcesses]
  ADD CONSTRAINT [FK_SetupProcess_Users_USER_USERID_copy_copy_copy_copy_copy] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([USER_USERID])
GO