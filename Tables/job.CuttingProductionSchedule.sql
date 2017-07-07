CREATE TABLE [job].[CuttingProductionSchedule] (
  [Id] [int] IDENTITY,
  [ScheduledStartTime] [datetime] NOT NULL,
  [ExpectedEndTime] [datetime] NOT NULL,
  [ProcessGroupId] [int] NOT NULL,
  [Notes] [varchar](5000) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_SetupSchedule_copy_copy_copy_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[CuttingProductionSchedule]
  ADD CONSTRAINT [FK_CuttingSchedule_CuttingProcessGroups_Id] FOREIGN KEY ([ProcessGroupId]) REFERENCES [job].[CuttingProductionProcessGroups] ([Id])
GO