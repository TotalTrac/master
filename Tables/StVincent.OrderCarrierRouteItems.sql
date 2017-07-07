CREATE TABLE [StVincent].[OrderCarrierRouteItems] (
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

ALTER TABLE [StVincent].[OrderCarrierRouteItems]
  ADD CONSTRAINT [FK_OrderCarrierRouteItems_CountResults] FOREIGN KEY ([CRRT_COUNTRESULTID]) REFERENCES [StVincent].[CountResults] ([COUNT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [StVincent].[OrderCarrierRouteItems]
  ADD CONSTRAINT [FK_OrderCarrierRouteItems_OrderCarrierRoutes] FOREIGN KEY ([CRRT_CARRIERROUTEID]) REFERENCES [StVincent].[OrderCarrierRoutes] ([CRRT_ID]) ON DELETE CASCADE
GO