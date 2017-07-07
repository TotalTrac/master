CREATE TABLE [job].[Operators] (
  [Id] [int] IDENTITY,
  [OperatorName] [varchar](200) NOT NULL,
  [OperatorTypeId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_Operators] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO