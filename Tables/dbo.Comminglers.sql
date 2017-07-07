﻿CREATE TABLE [dbo].[Comminglers] (
  [COMMINGLER_ID] [int] IDENTITY (-2147483648, 1),
  [COMMINGLER_ADDRESS1] [nvarchar](100) NULL,
  [COMMINGLER_ADDRESS2] [nvarchar](100) NULL,
  [COMMINGLER_CITY] [nvarchar](50) NULL,
  [COMMINGLER_CONTACT] [nvarchar](50) NULL,
  [COMMINGLER_EMAIL] [nvarchar](320) NULL,
  [COMMINGLER_FAX] [char](15) NULL,
  [COMMINGLER_INTERNAL] [bit] NOT NULL,
  [COMMINGLER_LEGALNAME] [nvarchar](200) NULL,
  [COMMINGLER_NAME] [nvarchar](100) NOT NULL,
  [COMMINGLER_PARENTID] [int] NULL,
  [COMMINGLER_PHONE] [char](15) NULL,
  [COMMINGLER_POSTALCODE] [nchar](15) NULL,
  [COMMINGLER_PUBLIC] [bit] NULL,
  [COMMINGLER_REGION] [nvarchar](50) NULL,
  [COMMINGLER_SHORTNAME] [nvarchar](50) NOT NULL,
  [COMMINGLER_URL] [nvarchar](255) NULL,
  [COMMINGLER_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Comminglers] PRIMARY KEY CLUSTERED ([COMMINGLER_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO