CREATE TABLE [usps].[GeographicalRegions] (
  [Id] [int] NOT NULL,
  [Name] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_GeographicalRegion] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO