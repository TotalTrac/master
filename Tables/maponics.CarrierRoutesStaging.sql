CREATE TABLE [maponics].[CarrierRoutesStaging] (
  [zipcrrt] [char](9) NOT NULL,
  [zip] [char](5) NOT NULL,
  [crrt] [char](4) NOT NULL,
  [city] [varchar](28) NOT NULL,
  [state] [char](2) NOT NULL,
  [statefips] [char](2) NOT NULL,
  [countyfips] [char](6) NOT NULL,
  [lat] [decimal](16, 13) NOT NULL,
  [lon] [decimal](16, 13) NOT NULL,
  [rescount] [int] NOT NULL,
  [mfu] [int] NOT NULL,
  [sfu] [int] NOT NULL,
  [box] [int] NOT NULL,
  [biz] [int] NOT NULL,
  [ver] [char](10) NOT NULL,
  [wkt] [varchar](max) NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO