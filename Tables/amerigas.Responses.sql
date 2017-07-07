﻿CREATE TABLE [amerigas].[Responses] (
  [RESPONSE_ID] [int] IDENTITY (-2147483648, 1),
  [RESPONSE_ADDRESS1] [varchar](60) NULL,
  [RESPONSE_ADDRESS2] [varchar](60) NULL,
  [RESPONSE_ADDRESS3] [varchar](60) NULL,
  [RESPONSE_CITY] [varchar](28) NULL,
  [RESPONSE_COMPANY] [nvarchar](50) NULL,
  [RESPONSE_EMAIL] [nvarchar](320) NULL,
  [RESPONSE_FIRSTNAME] [varchar](20) NULL,
  [RESPONSE_LASTNAME] [varchar](20) NULL,
  [RESPONSE_MAILPIECEID] [int] NOT NULL,
  [RESPONSE_OTHER] [varchar](100) NULL,
  [RESPONSE_PHONE] [char](15) NULL,
  [RESPONSE_STATE] [char](2) NULL,
  [RESPONSE_ZIPCODE] [char](9) NOT NULL,
  [RESPONSE_UPDATED] [datetime] NOT NULL,
  [RESPONSE_USAGE] [int] NOT NULL,
  [RESPONSE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Responses] PRIMARY KEY CLUSTERED ([RESPONSE_ID])
)
ON [PRIMARY]
GO