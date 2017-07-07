CREATE TABLE [dbo].[DataPushConfigurations] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [HostName] [nvarchar](253) NOT NULL,
  [Interval] [smallint] NOT NULL,
  [LastRun] [datetime] NULL,
  [Password] [nvarchar](120) NULL,
  [ProviderType] [nvarchar](200) NOT NULL,
  [Settings] [nvarchar](max) NULL,
  [Start] [datetime] NOT NULL,
  [Username] [nvarchar](120) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_DataPushConfigurations] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO