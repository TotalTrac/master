CREATE TABLE [usps].[FacilitiesStaging] (
  [fbdid] [int] NOT NULL,
  [name] [varchar](max) NOT NULL,
  [localekey] [varchar](10) NOT NULL,
  [nasscode] [varchar](10) NOT NULL,
  [zip] [char](9) NOT NULL,
  [financenumber] [int] NULL,
  [type] [varchar](60) NOT NULL,
  [subtype] [varchar](60) NOT NULL,
  [address] [varchar](200) NOT NULL,
  [city] [varchar](50) NOT NULL,
  [state] [char](2) NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO