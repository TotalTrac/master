﻿CREATE TABLE [log].[MessageTypes] (
  [MESSAGETYPE_ID] [int] IDENTITY (-2147483648, 1),
  [MESSAGETYPE_NAME] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_LogMessageTypes] PRIMARY KEY CLUSTERED ([MESSAGETYPE_ID])
)
ON [PRIMARY]
GO