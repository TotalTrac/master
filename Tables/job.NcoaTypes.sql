CREATE TABLE [job].[NcoaTypes] (
  [Id] [int] IDENTITY,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_NcoaTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO