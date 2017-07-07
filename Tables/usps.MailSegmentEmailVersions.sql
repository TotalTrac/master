CREATE TABLE [usps].[MailSegmentEmailVersions] (
  [VERSION_VERSIONID] [int] NOT NULL,
  [VERSION_SEGMENTID] [int] NOT NULL,
  [VERSION_TRIGGEREVENT] [int] NOT NULL
)
ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [PK_MailSegmentEmailVersions]
  ON [usps].[MailSegmentEmailVersions] ([VERSION_SEGMENTID], [VERSION_VERSIONID], [VERSION_TRIGGEREVENT])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[MailSegmentEmailVersions]
  ADD CONSTRAINT [FK_SegmentEmailVersions_EmailVersions] FOREIGN KEY ([VERSION_VERSIONID]) REFERENCES [email].[Versions] ([Id]) ON DELETE CASCADE
GO

ALTER TABLE [usps].[MailSegmentEmailVersions] WITH NOCHECK
  ADD CONSTRAINT [FK_SegmentEmailVersions_MailSegments] FOREIGN KEY ([VERSION_SEGMENTID]) REFERENCES [dbo].[MailSegments] ([MAILSEGMENT_ID]) ON DELETE CASCADE
GO