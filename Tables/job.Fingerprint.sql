CREATE TABLE [job].[Fingerprint] (
  [Id] [int] IDENTITY,
  [FingerTypeId] [int] NOT NULL,
  [FingerTemplate] [varbinary](max) NOT NULL,
  [OperatorId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Fingerprint] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[Fingerprint]
  ADD CONSTRAINT [FK_Fingerprint_Operators_Id] FOREIGN KEY ([OperatorId]) REFERENCES [job].[Operators] ([Id])
GO