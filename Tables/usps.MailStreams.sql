﻿CREATE TABLE [usps].[MailStreams] (
  [MAILSTREAM_ID] [int] IDENTITY (-2147483648, 1),
  [MAILSTREAM_NAME] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_tblMailStreams] PRIMARY KEY CLUSTERED ([MAILSTREAM_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO