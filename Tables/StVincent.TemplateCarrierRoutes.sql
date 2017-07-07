CREATE TABLE [StVincent].[TemplateCarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_TemplateCarrierRoute] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [StVincent].[TemplateCarrierRoutes]
  ADD CONSTRAINT [FK_TemplateCarrierRoute_TemplateZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [StVincent].[TemplateZipCodes] ([ZIPCODE_ID]) ON DELETE CASCADE
GO