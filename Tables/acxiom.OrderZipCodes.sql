CREATE TABLE [acxiom].[OrderZipCodes] (
  [ZIPCODE_ID] [int] IDENTITY (-2147483648, 1),
  [ZIPCODE_CREATED] [datetime] NOT NULL,
  [ZIPCODE_CREATEDBYID] [int] NOT NULL,
  [ZIPCODE_NAME] [char](10) NOT NULL,
  [ZIPCODE_ZIPCODE] [char](5) NOT NULL,
  [ZIPCODE_ROWVERSION] [timestamp],
  CONSTRAINT [PK_OrderZipCodeItem] PRIMARY KEY CLUSTERED ([ZIPCODE_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [_dta_index_OrderZipCodes_5_500912856__K1]
  ON [acxiom].[OrderZipCodes] ([ZIPCODE_ID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderZipCodeItems_CreatedByID]
  ON [acxiom].[OrderZipCodes] ([ZIPCODE_CREATEDBYID])
  ON [PRIMARY]
GO