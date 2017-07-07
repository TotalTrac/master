CREATE TABLE [keying].[KLFDownloads] (
  [id] [int] IDENTITY,
  [batch] [varchar](20) NOT NULL,
  [datetimedownloaded] [datetime] NOT NULL,
  CONSTRAINT [PK_KFLDownloads] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO