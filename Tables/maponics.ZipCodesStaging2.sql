CREATE TABLE [maponics].[ZipCodesStaging2] (
  [zip] [char](5) NOT NULL,
  [name] [varchar](28) NOT NULL,
  [ziptype] [char](50) NOT NULL,
  [state] [char](2) NOT NULL,
  [statefips] [int] NOT NULL,
  [countyfips] [int] NOT NULL,
  [countyname] [varchar](30) NOT NULL,
  [s3dzip] [char](3) NOT NULL,
  [lat] [decimal](16, 13) NOT NULL,
  [lon] [decimal](16, 13) NOT NULL,
  [enczip] [char](8) NULL,
  [rescount] [int] NOT NULL,
  [mfu] [int] NOT NULL,
  [sfu] [int] NOT NULL,
  [box] [int] NOT NULL,
  [biz] [int] NOT NULL,
  [ver] [char](10) NOT NULL,
  [wkt] [nvarchar](max) NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_ZipCode]
  ON [maponics].[ZipCodesStaging2] ([zip])
  ON [PRIMARY]
GO