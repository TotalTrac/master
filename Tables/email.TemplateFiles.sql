CREATE TABLE [email].[TemplateFiles] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Data] [varbinary](max) NOT NULL,
  [Name] [nvarchar](200) NOT NULL,
  [Size] [bigint] NOT NULL,
  [Rowversion] [timestamp]
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO