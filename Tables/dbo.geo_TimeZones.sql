CREATE TABLE [dbo].[geo_TimeZones] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [TimeZoneWkt] [varchar](max) NULL,
  [TimeZoneWkb] [geometry] NULL,
  [ZoneId] [varchar](255) NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [geo_TimeZones_Spatial]
  ON [dbo].[geo_TimeZones] ([TimeZoneWkb])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO