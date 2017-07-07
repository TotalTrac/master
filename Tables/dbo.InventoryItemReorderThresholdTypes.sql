CREATE TABLE [dbo].[InventoryItemReorderThresholdTypes] (
  [TYPE_ID] [int] IDENTITY (0, 1),
  [TYPE_NAME] [nvarchar](10) NOT NULL,
  CONSTRAINT [PK_InventoryItemReorderThresholdTypes] PRIMARY KEY CLUSTERED ([TYPE_ID])
)
ON [PRIMARY]
GO