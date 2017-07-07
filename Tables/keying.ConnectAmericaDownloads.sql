CREATE TABLE [keying].[ConnectAmericaDownloads] (
  [id] [int] IDENTITY,
  [batch] [varchar](20) NOT NULL,
  [datetimedownloaded] [datetime] NOT NULL,
  CONSTRAINT [PK_ConnectAmericaDownloads] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO