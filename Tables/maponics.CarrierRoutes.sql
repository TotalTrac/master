CREATE TABLE [maponics].[CarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_BOXES] [int] NOT NULL,
  [CRRT_BUSINESS] [int] NOT NULL,
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_LATITUDE] [decimal](16, 13) NOT NULL,
  [CRRT_LONGITUDE] [decimal](16, 13) NOT NULL,
  [CRRT_MFDU] [int] NOT NULL,
  [CRRT_SFDU] [int] NOT NULL,
  [CRRT_WKB] [geometry] NOT NULL,
  [CRRT_WKT] [varchar](max) NOT NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_CarrierRoutes] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_CarrierRoutes_ZipCodeID]
  ON [maponics].[CarrierRoutes] ([CRRT_ZIPCODEID])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [IX_CarrierRoutes_Spatial]
  ON [maponics].[CarrierRoutes] ([CRRT_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO

ALTER TABLE [maponics].[CarrierRoutes]
  ADD CONSTRAINT [FK_CarrierRoutes_ZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [maponics].[ZipCodes] ([ZIPCODE_ID])
GO