CREATE TABLE [job].[OperatorPunches] (
  [Id] [int] IDENTITY,
  [OperatorId] [int] NOT NULL,
  [PunchTime] [datetime] NOT NULL,
  [PunchTypeId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_OperatorPunches] PRIMARY KEY CLUSTERED ([Id]) WITH (STATISTICS_NORECOMPUTE = ON)
)
ON [PRIMARY]
GO

ALTER TABLE [job].[OperatorPunches]
  ADD CONSTRAINT [FK_OperatorPunches_Operators_Id] FOREIGN KEY ([OperatorId]) REFERENCES [job].[Operators] ([Id])
GO

ALTER TABLE [job].[OperatorPunches]
  ADD CONSTRAINT [FK_OperatorPunches_PunchTypes_Id] FOREIGN KEY ([PunchTypeId]) REFERENCES [job].[PunchTypes] ([Id])
GO