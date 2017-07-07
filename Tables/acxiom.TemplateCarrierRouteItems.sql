CREATE TABLE [acxiom].[TemplateCarrierRouteItems] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_AVAILABLE] [int] NOT NULL,
  [CRRT_CARRIERROUTEID] [int] NOT NULL,
  [CRRT_REQUESTED] [int] NULL,
  [CRRT_SELECTED] [bit] NOT NULL,
  [CRRT_TYPE] [int] NOT NULL,
  [CRRT_ROWVERSION] [timestamp],
  CONSTRAINT [PK_TemplateCarrierRouteItems] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [acxiom].[TemplateCarrierRouteItems]
  ADD CONSTRAINT [FK_TemplateCarrierRouteItems_TemplateCarrierRoutes] FOREIGN KEY ([CRRT_CARRIERROUTEID]) REFERENCES [acxiom].[TemplateCarrierRoutes] ([CRRT_ID]) ON DELETE CASCADE
GO