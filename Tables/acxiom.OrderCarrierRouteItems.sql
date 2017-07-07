CREATE TABLE [acxiom].[OrderCarrierRouteItems] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_AVAILABLE] [int] NOT NULL,
  [CRRT_CARRIERROUTEID] [int] NOT NULL,
  [CRRT_COUNTRESULTID] [int] NOT NULL,
  [CRRT_REQUESTED] [int] NULL,
  [CRRT_SELECTED] [bit] NOT NULL,
  [CRRT_TYPE] [int] NOT NULL,
  [CRRT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_OrderCarrierRouteItems] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [_dta_index_OrderCarrierRouteItems_5_404912514__K3_K1_2_4_5_6_7_8]
  ON [acxiom].[OrderCarrierRouteItems] ([CRRT_CARRIERROUTEID], [CRRT_ID])
  INCLUDE ([CRRT_AVAILABLE], [CRRT_COUNTRESULTID], [CRRT_REQUESTED], [CRRT_SELECTED], [CRRT_TYPE], [CRRT_ROWVERSION])
  ON [PRIMARY]
GO

CREATE INDEX [_dta_index_OrderCarrierRouteItems_5_404912514__K6_3_5]
  ON [acxiom].[OrderCarrierRouteItems] ([CRRT_SELECTED])
  INCLUDE ([CRRT_CARRIERROUTEID], [CRRT_REQUESTED])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderCarrierRouteItems_CarrierRouteID]
  ON [acxiom].[OrderCarrierRouteItems] ([CRRT_CARRIERROUTEID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_OrderCarrierRouteItems_CountResultID]
  ON [acxiom].[OrderCarrierRouteItems] ([CRRT_COUNTRESULTID])
  INCLUDE ([CRRT_ID], [CRRT_AVAILABLE], [CRRT_CARRIERROUTEID], [CRRT_REQUESTED], [CRRT_SELECTED], [CRRT_TYPE], [CRRT_ROWVERSION])
  ON [PRIMARY]
GO

ALTER TABLE [acxiom].[OrderCarrierRouteItems]
  ADD CONSTRAINT [FK_OrderCarrierRouteItems_CountResults] FOREIGN KEY ([CRRT_COUNTRESULTID]) REFERENCES [acxiom].[CountResults] ([COUNT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [acxiom].[OrderCarrierRouteItems]
  ADD CONSTRAINT [FK_OrderCarrierRouteItems_OrderCarrierRoutes] FOREIGN KEY ([CRRT_CARRIERROUTEID]) REFERENCES [acxiom].[OrderCarrierRoutes] ([CRRT_ID]) ON DELETE CASCADE
GO