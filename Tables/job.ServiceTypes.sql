CREATE TABLE [job].[ServiceTypes] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_ServiceTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO