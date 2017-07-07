﻿CREATE TABLE [usps].[PostageRates] (
  [RATE_ID] [int] IDENTITY (-2147483648, 1),
  [RATE_CATEGORYID] [int] NOT NULL,
  [RATE_EFFECTIVEDATE] [datetime] NOT NULL,
  [RATE_ENTRYPOINTLEVELID] [int] NOT NULL,
  [RATE_NONPROFIT] [bit] NOT NULL,
  [RATE_PIECETYPEID] [int] NOT NULL,
  [RATE_POSTALCLASSID] [int] NOT NULL,
  [RATE_RATE] [smallmoney] NOT NULL,
  [RATE_WEIGHTMAX] [decimal](5, 3) NOT NULL,
  [RATE_WEIGHTMIN] [decimal](5, 3) NOT NULL,
  CONSTRAINT [PK_PostageRates] PRIMARY KEY CLUSTERED ([RATE_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[PostageRates]
  ADD CONSTRAINT [FK_PostageRates_EntryPointLevels] FOREIGN KEY ([RATE_CATEGORYID]) REFERENCES [usps].[RateCategories] ([CATEGORY_ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[PostageRates]
  ADD CONSTRAINT [FK_PostageRates_PieceTypes] FOREIGN KEY ([RATE_PIECETYPEID]) REFERENCES [usps].[PieceTypes] ([PIECETYPE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[PostageRates]
  ADD CONSTRAINT [FK_PostageRates_PostalClasses] FOREIGN KEY ([RATE_POSTALCLASSID]) REFERENCES [usps].[PostalClasses] ([POSTALCLASS_ID]) ON DELETE CASCADE
GO