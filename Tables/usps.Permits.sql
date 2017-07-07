﻿CREATE TABLE [usps].[Permits] (
  [PERMIT_ID] [int] IDENTITY (-2147483648, 1),
  [PERMIT_ACCOUNTNUMBER] [char](10) NULL,
  [PERMIT_ADDRESS1] [varchar](50) NULL,
  [PERMIT_ADDRESS2] [varchar](50) NULL,
  [PERMIT_CITY] [varchar](50) NULL,
  [PERMIT_COMPANY] [nvarchar](100) NULL,
  [PERMIT_CLIENTID] [int] NOT NULL CONSTRAINT [DF_tblPermits_PERMIT_CLIENT_ID] DEFAULT (0),
  [PERMIT_CREATED] [datetime] NOT NULL,
  [PERMIT_CREATEDBYID] [int] NOT NULL,
  [PERMIT_EXPIRATIONDATE] [date] NULL,
  [PERMIT_GLOBAL] [bit] NOT NULL CONSTRAINT [DF_tblPermits_PERMIT_GLOBAL] DEFAULT (0),
  [PERMIT_NUMBER] [char](6) NOT NULL CONSTRAINT [DF_tblPermits_PERMIT_NUMBER] DEFAULT (0),
  [PERMIT_POSTOFFICE] [char](5) NOT NULL,
  [PERMIT_STATE] [char](2) NULL,
  [PERMIT_TYPEID] [int] NOT NULL CONSTRAINT [DF_tblPermits_PERMIT_TYPE_ID] DEFAULT (0),
  [PERMIT_ZIPCODE] [char](9) NULL,
  [PERMIT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_Permits] PRIMARY KEY CLUSTERED ([PERMIT_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Permits_ClientID]
  ON [usps].[Permits] ([PERMIT_CLIENTID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Permits_TypeID]
  ON [usps].[Permits] ([PERMIT_TYPEID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[Permits]
  ADD CONSTRAINT [FK_Permits_Clients] FOREIGN KEY ([PERMIT_CLIENTID]) REFERENCES [dbo].[Clients] ([CLIENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[Permits]
  ADD CONSTRAINT [FK_Permits_PermitTypes] FOREIGN KEY ([PERMIT_TYPEID]) REFERENCES [usps].[PermitTypes] ([PERMITTYPE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[Permits]
  ADD CONSTRAINT [FK_Permits_Users] FOREIGN KEY ([PERMIT_CREATEDBYID]) REFERENCES [dbo].[Users] ([USER_USERID])
GO