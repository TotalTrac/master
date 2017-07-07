﻿CREATE TABLE [usps].[MailLevels] (
  [MAILLEVEL_ID] [int] IDENTITY (-2147483648, 1),
  [MAILLEVEL_NAME] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_MailLevels] PRIMARY KEY CLUSTERED ([MAILLEVEL_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO