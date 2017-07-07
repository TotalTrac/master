CREATE TABLE [purpleheart].[OrderZipCodes] (
  [ZIPCODE_ID] [int] IDENTITY (-2147483648, 1),
  [ZIPCODE_DATE] [date] NOT NULL,
  [ZIPCODE_DEPOTID] [int] NOT NULL,
  [ZIPCODE_ITEMID] [int] NOT NULL,
  [ZIPCODE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_OrderZipCodeItems] PRIMARY KEY CLUSTERED ([ZIPCODE_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [_dta_index_OrderZipCodes_5_241435934__K2_K4]
  ON [purpleheart].[OrderZipCodes] ([ZIPCODE_DATE], [ZIPCODE_ITEMID])
  ON [PRIMARY]
GO

CREATE INDEX [_dta_index_OrderZipCodes_5_241435934__K3_K4_K2]
  ON [purpleheart].[OrderZipCodes] ([ZIPCODE_DEPOTID], [ZIPCODE_ITEMID], [ZIPCODE_DATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderZipCodeItems_DepotID]
  ON [purpleheart].[OrderZipCodes] ([ZIPCODE_DEPOTID])
  INCLUDE ([ZIPCODE_DATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderZipCodes_ItemID]
  ON [purpleheart].[OrderZipCodes] ([ZIPCODE_ITEMID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderZipCodes_ZIPCODE_DATE_ZIPCODE_DEPOTID]
  ON [purpleheart].[OrderZipCodes] ([ZIPCODE_DATE], [ZIPCODE_DEPOTID])
  INCLUDE ([ZIPCODE_ID], [ZIPCODE_ITEMID], [ZIPCODE_ROWVERSION])
  ON [PRIMARY]
GO