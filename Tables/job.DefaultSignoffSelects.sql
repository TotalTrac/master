CREATE TABLE [job].[DefaultSignoffSelects] (
  [Id] [int] IDENTITY,
  [Text] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_tblDefaultSignoffSelects] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO