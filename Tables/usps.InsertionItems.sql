CREATE TABLE [usps].[InsertionItems] (
  [ITEM_ID] [int] IDENTITY (-2147483648, 1),
  [ITEM_INDEX] [int] NOT NULL,
  [ITEM_INVENTORYITEMID] [int] NOT NULL,
  [ITEM_SEGMENTID] [int] NOT NULL,
  [ITEM_ROWVERSION] [timestamp],
  CONSTRAINT [PK_InsertionItems] PRIMARY KEY CLUSTERED ([ITEM_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailSegmentInsertionItems_ItemID]
  ON [usps].[InsertionItems] ([ITEM_INVENTORYITEMID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailSegmentInsertionItems_SegmentID]
  ON [usps].[InsertionItems] ([ITEM_SEGMENTID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[InsertionItems] WITH NOCHECK
  ADD CONSTRAINT [FK_MailSegmentInsertionItems_InventoryItems] FOREIGN KEY ([ITEM_INVENTORYITEMID]) REFERENCES [dbo].[InventoryItems] ([ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[InsertionItems] WITH NOCHECK
  ADD CONSTRAINT [FK_MailSegmentInsertionItems_MailSegments] FOREIGN KEY ([ITEM_SEGMENTID]) REFERENCES [dbo].[MailSegments] ([MAILSEGMENT_ID]) ON DELETE CASCADE
GO