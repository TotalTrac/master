CREATE TABLE [acxiom].[OrderCarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_OrderCarrierRoute] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_OrderCarrierRoute_ZipCodeItemID]
  ON [acxiom].[OrderCarrierRoutes] ([CRRT_ZIPCODEID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_OrderCarrierRoutes_Uniqueness]
  ON [acxiom].[OrderCarrierRoutes] ([CRRT_ZIPCODEID], [CRRT_CRRT])
  ON [PRIMARY]
GO

ALTER TABLE [acxiom].[OrderCarrierRoutes]
  ADD CONSTRAINT [FK_OrderCarrierRoutes_OrderZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [acxiom].[OrderZipCodes] ([ZIPCODE_ID]) ON DELETE CASCADE
GO