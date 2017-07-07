CREATE TABLE [StVincent].[OrderCarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_OrderCarrierRoute] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [StVincent].[OrderCarrierRoutes]
  ADD CONSTRAINT [FK_OrderCarrierRoutes_OrderZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [StVincent].[OrderZipCodes] ([ZIPCODE_ID]) ON DELETE CASCADE
GO