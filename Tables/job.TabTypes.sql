CREATE TABLE [job].[TabTypes] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_TabTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO