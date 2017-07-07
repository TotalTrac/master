CREATE TABLE [dbo].[AccessibilityLevels] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Name] [varchar](max) NOT NULL,
  [Description] [nvarchar](max) NULL,
  CONSTRAINT [PK_AccessibilityLevels] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO