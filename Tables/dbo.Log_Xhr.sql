CREATE TABLE [dbo].[Log_Xhr] (
  [Id] [int] IDENTITY,
  [Request] [varchar](max) NULL,
  [Response] [varchar](max) NULL,
  CONSTRAINT [PK_Log_Xhr] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO