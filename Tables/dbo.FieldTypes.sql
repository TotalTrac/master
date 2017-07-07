CREATE TABLE [dbo].[FieldTypes] (
  [Id] [int] IDENTITY (0, 1),
  [Description] [nvarchar](max) NULL,
  [FrameworkType] [varchar](max) NOT NULL,
  [Name] [varchar](max) NOT NULL,
  CONSTRAINT [PK_FieldTypes] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO