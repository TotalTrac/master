CREATE TABLE [job].[FontFamilies] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_FontFamilies] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO