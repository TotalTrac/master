CREATE TABLE [dbo].[geo_States] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [FipsId] [int] NULL,
  [StateWkt] [varchar](max) NULL,
  [StateWkb] [geometry] NULL,
  [Region] [varchar](2) NULL,
  [Division] [varchar](2) NULL,
  [GnisCode] [varchar](8) NULL,
  [GeoId] [varchar](2) NULL,
  [Abbreviation] [varchar](2) NULL,
  [Name] [varchar](100) NULL,
  [LsadId] [varchar](2) NULL,
  [FunctionalStatus] [varchar](1) NULL,
  [LandArea] [float] NULL,
  [WaterArea] [float] NULL,
  [InteriorLat] [varchar](11) NULL,
  [InteriorLon] [varchar](12) NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO