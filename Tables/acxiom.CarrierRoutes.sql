CREATE TABLE [acxiom].[CarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_AVERAGEAGE] [decimal](3) NULL,
  [CRRT_BOXES] [int] NOT NULL,
  [CRRT_BUSINESS] [int] NOT NULL,
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_INCOME] [decimal](8) NULL,
  [CRRT_LATITUDE] [decimal](16, 13) NULL,
  [CRRT_LONGITUDE] [decimal](16, 13) NULL,
  [CRRT_MFDU] [int] NOT NULL,
  [CRRT_MKTMED] [decimal](8) NULL,
  [CRRT_PERCENTCHILD] [decimal](3) NULL,
  [CRRT_SFDU] [int] NOT NULL,
  [CRRT_TRLR] [int] NOT NULL,
  [CRRT_WKB] [geometry] NULL,
  [CRRT_WKT] [varchar](max) NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_CarrierRoutes] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_CarrierRoutes_ZipCodeID]
  ON [acxiom].[CarrierRoutes] ([CRRT_ZIPCODEID])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [IX_CarrierRoutes_Spatial]
  ON [acxiom].[CarrierRoutes] ([CRRT_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO

ALTER TABLE [acxiom].[CarrierRoutes]
  ADD CONSTRAINT [FK_CarrierRoutes_ZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [acxiom].[ZipCodes] ([ZIPCODE_ID])
GO