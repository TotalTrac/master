CREATE TABLE [dbo].[_MostRecentMADPieces] (
  [FIELD_MAILPIECEID] [int] NOT NULL,
  [MAILPIECE_SEGMENTID] [int] NOT NULL,
  [MatchInfo] [varchar](200) NULL,
  [Longitude] [decimal](9, 6) NOT NULL,
  [Latitude] [decimal](9, 6) NOT NULL,
  [KNOWLEDGE_LINK_NUMBER] [varchar](50) NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailPieceSegmentID]
  ON [dbo].[_MostRecentMADPieces] ([MAILPIECE_SEGMENTID])
  INCLUDE ([FIELD_MAILPIECEID], [MatchInfo], [Longitude], [Latitude])
  ON [PRIMARY]
GO