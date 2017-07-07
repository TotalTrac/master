CREATE TABLE [dbo].[_brownmackie11x] (
  [userid] [int] NULL,
  [firstname] [varchar](100) NULL,
  [lastname] [varchar](100) NULL,
  [address] [varchar](100) NULL,
  [city] [varchar](100) NULL,
  [state] [char](2) NULL,
  [zipcode] [char](9) NULL,
  [daytime] [char](10) NULL,
  [evening] [char](10) NULL,
  [email] [varchar](320) NULL,
  [graduationyear] [int] NULL,
  [campusid] [int] NOT NULL,
  [campusname] [varchar](100) NULL,
  [programname] [varchar](100) NULL
)
ON [PRIMARY]
GO