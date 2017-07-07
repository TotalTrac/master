CREATE TABLE [job].[StampTypes] (
  [Id] [int] IDENTITY,
  [Name] [nvarchar](50) NOT NULL CONSTRAINT [DF_tblStampTypes_STAMPTYPE_NAME] DEFAULT (''),
  CONSTRAINT [PK_StampTypes] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_StampTypes_Uniqueness]
  ON [job].[StampTypes] ([Name])
  ON [PRIMARY]
GO