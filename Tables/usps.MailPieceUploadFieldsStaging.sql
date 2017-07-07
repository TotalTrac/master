CREATE TABLE [usps].[MailPieceUploadFieldsStaging] (
  [FIELD_KEY] [uniqueidentifier] NOT NULL,
  [FIELD_NAME] [nvarchar](100) NOT NULL,
  [FIELD_ROUTINGCODE] [char](11) NOT NULL,
  [FIELD_TRACKINGCODE] [char](20) NOT NULL,
  [FIELD_VALUE] [sql_variant] NULL
)
ON [PRIMARY]
GO