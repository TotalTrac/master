CREATE TABLE [job].[DataProcessingRequirements] (
  [Id] [int] IDENTITY,
  [Checked] [bit] NOT NULL,
  [JobId] [int] NOT NULL,
  [Text] [nvarchar](200) NOT NULL,
  [Rowversion] [timestamp],
  CONSTRAINT [PK_tblDataProcessingRequirements] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_tblDataProcessingRequirementsJobID]
  ON [job].[DataProcessingRequirements] ([JobId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO