CREATE TABLE [dbo].[MailPieceFieldsStaging] (
  [FIELD_NAME] [nvarchar](100) NOT NULL,
  [FIELD_ROUTINGCODE] [char](11) NOT NULL,
  [FIELD_THREADID] [int] NOT NULL,
  [FIELD_TRACKINGCODE] [char](20) NOT NULL,
  [FIELD_VALUE] [sql_variant] NULL
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_MailPieceFieldsStaging_ThreadID]
  ON [dbo].[MailPieceFieldsStaging] ([FIELD_THREADID])
  ON [PRIMARY]
GO