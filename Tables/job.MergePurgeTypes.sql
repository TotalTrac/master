CREATE TABLE [job].[MergePurgeTypes] (
  [Id] [int] NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_MergePurgeTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO