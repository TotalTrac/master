CREATE TABLE [dbo].[TableFleetTriggerOct] (
  [MAILPIECE_ID] [int] NULL,
  [MAILPIECE_ADDRESS1] [nvarchar](max) NULL,
  [MAILPIECE_ADDRESS2] [nvarchar](max) NULL,
  [MAILPIECE_ADDRESS3] [nvarchar](max) NULL,
  [MAILPIECE_CITY] [nvarchar](max) NULL,
  [MAILPIECE_COMPANY] [nvarchar](max) NULL,
  [MAILPIECE_FIRSTNAME] [nvarchar](max) NULL,
  [MAILPIECE_GROUPID] [nvarchar](max) NULL,
  [MAILPIECE_INDIVIDUALID] [nvarchar](max) NULL,
  [MAILPIECE_LASTNAME] [nvarchar](max) NULL,
  [MAILPIECE_SEGMENTID] [int] NULL,
  [MAILPIECE_ROUTINGCODE] [nvarchar](max) NULL,
  [MAILPIECE_SCFID] [int] NULL,
  [MAILPIECE_STATE] [char](2) NULL,
  [MAILPIECE_TITLE] [nvarchar](max) NULL,
  [MAILPIECE_TRACKINGCODE] [nvarchar](max) NULL,
  [MAILPIECE_ZIPCODE] [nvarchar](max) NULL,
  [MAILPIECE_ZIPCODEEXT] [nvarchar](max) NULL,
  [MAILPIECE_CRRT] [nvarchar](max) NULL,
  [MAILPIECE_FINALIZESCANID] [int] NULL,
  [MAILPIECE_FORWARDSCANID] [int] NULL,
  [MAILPIECE_RETURNSCANID] [int] NULL,
  [MAILPIECE_FIRSTSCANID] [int] NULL,
  [MAILPIECE_LASTSCANID] [int] NULL,
  [MAILPIECE_TARGETID] [int] NULL,
  [MAILPIECE_DELIVERYDATE] [date] NULL,
  [PURL] [sql_variant] NULL,
  [PIN] [sql_variant] NULL,
  [EMAIL] [sql_variant] NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO