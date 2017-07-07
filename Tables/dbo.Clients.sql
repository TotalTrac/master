﻿CREATE TABLE [dbo].[Clients] (
  [CLIENT_ID] [int] IDENTITY,
  [CLIENT_ADDRESS1] [nvarchar](100) NULL,
  [CLIENT_ADDRESS2] [nvarchar](100) NULL,
  [CLIENT_BRANDED] [bit] NOT NULL,
  [CLIENT_CITY] [nvarchar](50) NULL,
  [CLIENT_CONTACT] [nvarchar](50) NULL,
  [CLIENT_CREATED] [datetime] NOT NULL,
  [CLIENT_CREATEDBYID] [int] NOT NULL,
  [CLIENT_EMAIL] [nvarchar](320) NULL,
  [CLIENT_FAVICON] [nvarchar](255) NULL,
  [CLIENT_FAX] [char](15) NULL,
  [CLIENT_INTERNAL] [bit] NOT NULL,
  [CLIENT_LEGALNAME] [nvarchar](200) NULL,
  [CLIENT_NAME] [nvarchar](100) NOT NULL,
  [CLIENT_NONPROFITAUTH] [char](10) NULL,
  [CLIENT_PARENTID] [int] NULL,
  [CLIENT_PHONE] [char](15) NULL,
  [CLIENT_POSTALCODE] [nchar](15) NULL,
  [CLIENT_REGION] [nvarchar](50) NULL,
  [CLIENT_SHORTNAME] [nvarchar](50) NOT NULL,
  [CLIENT_STYLESHEET] [nvarchar](100) NULL,
  [CLIENT_SUBDOMAIN] [nvarchar](50) NULL,
  [CLIENT_TYPE] [int] NULL,
  [CLIENT_URL] [nvarchar](255) NULL,
  [CLIENT_VENDOR] [bit] NOT NULL,
  [CLIENT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED ([CLIENT_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [_dta_index_Clients_5_1453964256__K1_14_20]
  ON [dbo].[Clients] ([CLIENT_ID])
  INCLUDE ([CLIENT_NAME], [CLIENT_SHORTNAME])
  ON [PRIMARY]
GO

CREATE INDEX [_dta_index_Clients_5_1453964256__K16_K1]
  ON [dbo].[Clients] ([CLIENT_PARENTID], [CLIENT_ID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Clients_ParentID]
  ON [dbo].[Clients] ([CLIENT_PARENTID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Clients_Subdomain]
  ON [dbo].[Clients] ([CLIENT_SUBDOMAIN])
  WHERE ([CLIENT_SUBDOMAIN] IS NOT NULL)
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Clients_Uniqueness]
  ON [dbo].[Clients] ([CLIENT_PARENTID], [CLIENT_SHORTNAME])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clients]
  ADD CONSTRAINT [FK_Clients_Users] FOREIGN KEY ([CLIENT_CREATEDBYID]) REFERENCES [dbo].[Users] ([USER_USERID])
GO