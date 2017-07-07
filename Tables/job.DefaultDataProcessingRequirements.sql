CREATE TABLE [job].[DefaultDataProcessingRequirements] (
  [Id] [int] IDENTITY,
  [Text] [nvarchar](200) NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_tblDefaultDataProcessingRequirements] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO