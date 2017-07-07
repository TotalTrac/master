CREATE TABLE [StVincent].[Leads] (
  [RECORD_ID] [int] IDENTITY,
  [RECORD_PREFIXTTL] [varchar](4) NULL,
  [RECORD_INDIVIDUALNAME] [varchar](70) NULL,
  [RECORD_FIRSTNAME] [varchar](35) NULL,
  [RECORD_MIDDLENAME] [varchar](1) NULL,
  [RECORD_LASTNAME] [varchar](35) NULL,
  [RECORD_ADDRESS] [varchar](50) NULL,
  [RECORD_ADDRESS2LINE] [varchar](35) NULL,
  [RECORD_CITY] [varchar](30) NULL,
  [RECORD_STATE] [varchar](2) NULL,
  [RECORD_ZIP] [varchar](5) NULL,
  [RECORD_ZIP4] [varchar](4) NULL,
  [RECORD_DPBC] [varchar](3) NULL,
  [RECORD_CONFIDENCECODE] [varchar](1) NULL,
  [RECORD_POSTSUPPPHONE] [varchar](10) NULL,
  [RECORD_RELIGION] [varchar](1) NULL,
  [RECORD_SECPHONEFLAG] [varchar](1) NULL,
  [RECORD_CRRT] [varchar](4) NULL,
  [RECORD_DSFWALKSEQUENCE] [varchar](4) NULL,
  [RECORD_COUNTY] [varchar](3) NULL
)
ON [PRIMARY]
GO