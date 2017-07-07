CREATE TABLE [usps].[MailSegmentPostageUsageItems] (
  [MAILSEGMENT_ID] [int] NOT NULL,
  [USAGEITEM_ID] [int] NOT NULL,
  CONSTRAINT [PK_MailSegmentPostageUsageItems] PRIMARY KEY CLUSTERED ([MAILSEGMENT_ID], [USAGEITEM_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[MailSegmentPostageUsageItems] WITH NOCHECK
  ADD CONSTRAINT [FK_MailSegmentPostageUsageItems_MailSegments] FOREIGN KEY ([MAILSEGMENT_ID]) REFERENCES [dbo].[MailSegments] ([MAILSEGMENT_ID]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[MailSegmentPostageUsageItems]
  ADD CONSTRAINT [FK_MailSegmentPostageUsageItems_PostageUsageItems] FOREIGN KEY ([USAGEITEM_ID]) REFERENCES [usps].[tmp_devart_PostageUsageItems] ([USAGEITEM_ID]) ON DELETE CASCADE
GO