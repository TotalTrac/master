CREATE TABLE [dbo].[GeographicalRegion] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_GeographicalRegion_1] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO