﻿CREATE TABLE [site].[PasswordResetRequests] (
  [REQUEST_ID] [int] IDENTITY (-2147483648, 1),
  [REQUEST_DATETIME] [datetime] NOT NULL,
  [REQUEST_HOST] [nvarchar](4000) NOT NULL,
  [REQUEST_IPADDRESS] [varbinary](8) NOT NULL,
  [REQUEST_KEY] [char](64) NOT NULL,
  [REQUEST_TIMESTAMP] [bigint] NOT NULL,
  [REQUEST_USERID] [int] NOT NULL,
  [REQUEST_USERNAME] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_PasswordResetRequests] PRIMARY KEY CLUSTERED ([REQUEST_ID])
)
ON [PRIMARY]
GO