CREATE TABLE [maponics].[ZipCodeSalesMetaStaging] (
  [fips] [char](5) NOT NULL,
  [state] [char](2) NOT NULL,
  [county] [char](50) NOT NULL,
  [deed] [char](3) NOT NULL,
  [mortgage] [char](3) NOT NULL,
  [nondisclosure] [char](3) NOT NULL,
  [recordingdate] [char](10) NOT NULL,
  [ctx_ver] [char](7) NOT NULL,
  [ver] [char](6) NOT NULL
)
ON [PRIMARY]
GO