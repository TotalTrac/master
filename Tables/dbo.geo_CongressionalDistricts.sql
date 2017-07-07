CREATE TABLE [dbo].[geo_CongressionalDistricts] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [FipsId] [varchar](255) NULL,
  [CongressionalWkt] [varchar](max) NULL,
  [CongressionalWkb] [geometry] NULL,
  [StateFipsId] [varchar](255) NULL,
  [GeoId] [varchar](255) NULL,
  [Name] [varchar](255) NULL,
  [Lsad] [varchar](255) NULL,
  [SessionCode] [varchar](255) NULL,
  [mtfcc] [varchar](255) NULL,
  [FunctionalStatus] [varchar](255) NULL,
  [LandArea] [float] NULL,
  [WaterArea] [float] NULL,
  [InteriorLat] [varchar](255) NULL,
  [InteriorLon] [varchar](255) NULL,
  CONSTRAINT [PK__Geo_Cong__3214EC076B53D559] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO