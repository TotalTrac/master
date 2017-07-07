﻿CREATE TABLE [maponics].[ZipCodes] (
  [ZIPCODE_ID] [int] IDENTITY,
  [ZIPCODE_AVERAGEAGE] [decimal](3, 1) NULL,
  [ZIPCODE_AVGTREND] [smallint] NULL,
  [ZIPCODE_BOXES] [int] NOT NULL,
  [ZIPCODE_BUSINESS] [int] NOT NULL,
  [ZIPCODE_CITY] [varchar](28) NOT NULL,
  [ZIPCODE_CNDAVERAGE] [int] NULL,
  [ZIPCODE_CNDLTVAVG] [decimal](3, 2) NULL,
  [ZIPCODE_CNDLTVMED] [decimal](3, 2) NULL,
  [ZIPCODE_CNDMEDIAN] [int] NULL,
  [ZIPCODE_CNDMKTAVG] [int] NULL,
  [ZIPCODE_CNDMKTMED] [int] NULL,
  [ZIPCODE_CNDSALES] [int] NULL,
  [ZIPCODE_CNDVOLUME] [int] NULL,
  [ZIPCODE_COUNTY] [varchar](30) NOT NULL,
  [ZIPCODE_COUNTYFIPS] [char](5) NOT NULL,
  [ZIPCODE_LATITUDE] [decimal](16, 13) NOT NULL,
  [ZIPCODE_LONGITUDE] [decimal](16, 13) NOT NULL,
  [ZIPCODE_MFDU] [int] NOT NULL,
  [ZIPCODE_SFDU] [int] NOT NULL,
  [ZIPCODE_SFDUAVERAGE] [int] NULL,
  [ZIPCODE_SFDULTVAVG] [decimal](3, 2) NULL,
  [ZIPCODE_SFDULTVMED] [decimal](3, 2) NULL,
  [ZIPCODE_SFDUMEDIAN] [int] NULL,
  [ZIPCODE_SFDUMKTAVG] [int] NULL,
  [ZIPCODE_SFDUMKTMED] [int] NULL,
  [ZIPCODE_SFDUSALES] [int] NULL,
  [ZIPCODE_SFDUVOLUME] [int] NULL,
  [ZIPCODE_STATE] [char](2) NOT NULL,
  [ZIPCODE_STATEFIPS] [char](2) NOT NULL,
  [ZIPCODE_TREND] [smallint] NULL,
  [ZIPCODE_TURNOVER] [decimal](3, 2) NULL,
  [ZIPCODE_VELOCITY] [int] NULL,
  [ZIPCODE_WKB] [geometry] NOT NULL,
  [ZIPCODE_WKT] [varchar](max) NOT NULL,
  CONSTRAINT [PK_ZipCodes] PRIMARY KEY CLUSTERED ([ZIPCODE_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [IX_ZipCodes_Spatial]
  ON [maponics].[ZipCodes] ([ZIPCODE_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [qgs_ZIPCODE_WKB_sidx]
  ON [maponics].[ZipCodes] ([ZIPCODE_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [IX_ZipCodes_Spatial]
  ON [maponics].[ZipCodes] ([ZIPCODE_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE SPATIAL INDEX [qgs_ZIPCODE_WKB_sidx]
  ON [maponics].[ZipCodes] ([ZIPCODE_WKB])
USING GEOMETRY_GRID
  WITH (BOUNDING_BOX = (XMIN = -180, YMIN = -90, XMAX = 180, YMAX = 90))
  ON [PRIMARY]
GO