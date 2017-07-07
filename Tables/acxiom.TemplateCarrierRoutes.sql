CREATE TABLE [acxiom].[TemplateCarrierRoutes] (
  [CRRT_ID] [int] IDENTITY (-2147483648, 1),
  [CRRT_CRRT] [char](4) NOT NULL,
  [CRRT_ZIPCODEID] [int] NOT NULL,
  CONSTRAINT [PK_TemplateCarrierRoute] PRIMARY KEY CLUSTERED ([CRRT_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [acxiom].[TemplateCarrierRoutes]
  ADD CONSTRAINT [FK_TemplateCarrierRoute_TemplateZipCodes] FOREIGN KEY ([CRRT_ZIPCODEID]) REFERENCES [acxiom].[TemplateZipCodes] ([ZIPCODE_ID]) ON DELETE CASCADE
GO