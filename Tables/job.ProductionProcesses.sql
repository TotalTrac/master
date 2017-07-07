CREATE TABLE [job].[ProductionProcesses] (
  [Id] [int] IDENTITY (-2147483647, 1),
  [MachineId] [int] NULL,
  [Notes] [varchar](5000) NULL,
  [OperatorId] [int] NULL,
  [ProcessType] [int] NULL,
  [ScheduledEndTime] [datetime] NULL,
  [ScheduledStartTime] [datetime] NULL,
  [StartTime] [datetime] NULL,
  [StopTime] [datetime] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_ProductionProcesses] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[ProductionProcesses]
  ADD CONSTRAINT [FK_ProductionProcesses] FOREIGN KEY ([OperatorId]) REFERENCES [job].[Operators] ([Id])
GO

ALTER TABLE [job].[ProductionProcesses]
  ADD CONSTRAINT [FK_ProductionProcesses_Machines_Id] FOREIGN KEY ([MachineId]) REFERENCES [job].[Machines] ([Id])
GO

ALTER TABLE [job].[ProductionProcesses]
  ADD CONSTRAINT [FK_ProductionProcesses_ProductionProcessTypes_Id] FOREIGN KEY ([ProcessType]) REFERENCES [job].[ProcessType] ([Id])
GO