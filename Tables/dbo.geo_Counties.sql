CREATE TABLE [dbo].[geo_Counties] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [FipsId] [varchar](255) NULL,
  [CountyWkt] [varchar](max) NULL,
  [CountyWkb] [geometry] NULL,
  [StateFipsId] [varchar](255) NULL,
  [GnisId] [varchar](255) NULL,
  [GeoId] [varchar](255) NULL,
  [Name] [varchar](255) NULL,
  [LsadId] [varchar](255) NULL,
  [ClassFipsId] [varchar](255) NULL,
  [FuncStatus] [varchar](255) NULL,
  [LandArea] [float] NULL,
  [WaterArea] [float] NULL,
  [InteriorLat] [varchar](255) NULL,
  [InteriorLon] [varchar](255) NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO