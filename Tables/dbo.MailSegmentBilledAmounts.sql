CREATE TABLE [dbo].[MailSegmentBilledAmounts] (
  [MAILSEGMENT_ID] [int] NOT NULL,
  [MAILSEGMENT_BILLEDAMOUNT] [int] NOT NULL,
  CONSTRAINT [PK_MailSegmentBilledAmounts] PRIMARY KEY CLUSTERED ([MAILSEGMENT_ID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[MailSegmentBilledAmounts]
  ADD CONSTRAINT [FK_MailSegmentBilledAmounts_MailSegments] FOREIGN KEY ([MAILSEGMENT_ID]) REFERENCES [dbo].[MailSegments] ([MAILSEGMENT_ID])
GO