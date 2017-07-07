CREATE TABLE [email].[Templates] (
  [Id] [int] IDENTITY,
  [Category] [int] NULL,
  [Color] [int] NULL,
  [Markup] [nvarchar](max) NOT NULL,
  [Name] [nvarchar](200) NULL,
  [Style] [int] NULL,
  [Rowversion] [timestamp]
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO