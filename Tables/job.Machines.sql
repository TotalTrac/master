CREATE TABLE [job].[Machines] (
  [Id] [int] IDENTITY,
  [MachineName] [varchar](50) NOT NULL,
  [MachineTypeId] [int] NOT NULL,
  [MachineLocationId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [job].[Machines]
  ADD CONSTRAINT [FK_Machines_MachineLocationTypes_Id] FOREIGN KEY ([MachineLocationId]) REFERENCES [job].[MachineLocationTypes] ([Id])
GO

ALTER TABLE [job].[Machines]
  ADD CONSTRAINT [FK_Machines_MachineTypes_Id] FOREIGN KEY ([MachineTypeId]) REFERENCES [job].[MachineTypes] ([Id])
GO