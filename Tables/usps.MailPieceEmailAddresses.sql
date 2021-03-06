﻿CREATE TABLE [usps].[MailPieceEmailAddresses] (
  [ADDRESS_ID] [int] IDENTITY (-2147483648, 1),
  [ADDRESS_MAILPIECEID] [int] NOT NULL,
  [ADDRESS_COMPANYNAME] [nvarchar](100) NULL,
  [ADDRESS_CUSTOMFIELD1] [sql_variant] SPARSE NULL,
  [ADDRESS_CUSTOMFIELD2] [sql_variant] SPARSE NULL,
  [ADDRESS_CUSTOMFIELD3] [sql_variant] SPARSE NULL,
  [ADDRESS_CUSTOMFIELD4] [sql_variant] SPARSE NULL,
  [ADDRESS_CUSTOMFIELD5] [sql_variant] SPARSE NULL,
  [ADDRESS_EMAILADDRESS] [nvarchar](320) NOT NULL,
  [ADDRESS_FIRSTNAME] [nvarchar](50) NULL,
  [ADDRESS_LASTNAME] [nvarchar](50) NULL,
  CONSTRAINT [PK_MailPieceEmailAddresses] PRIMARY KEY CLUSTERED ([ADDRESS_ID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_MailPieceEmailAddresses_Uniqueness]
  ON [usps].[MailPieceEmailAddresses] ([ADDRESS_MAILPIECEID], [ADDRESS_EMAILADDRESS])
  ON [PRIMARY]
GO