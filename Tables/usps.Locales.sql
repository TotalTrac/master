﻿CREATE TABLE [usps].[Locales] (
  [LOCALE_ID] [int] IDENTITY (-2147483648, 1),
  [LOCALE_KEY] [char](6) NOT NULL,
  [LOCALE_TYPEID] [int] NOT NULL,
  CONSTRAINT [PK_Locales] PRIMARY KEY CLUSTERED ([LOCALE_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[Locales]
  ADD CONSTRAINT [FK_Locales_LocaleTypes] FOREIGN KEY ([LOCALE_TYPEID]) REFERENCES [usps].[LocaleTypes] ([LOCALETYPE_ID]) ON DELETE CASCADE
GO